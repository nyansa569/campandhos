import 'dart:convert';

import 'package:cnahr/screens/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;

class AccountScreen extends StatefulWidget {
  final String token;
  const AccountScreen({required this.token, super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late String index;
  Map<String, dynamic> user = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    // print('Getting user...');

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${widget.token}', // Replace with the JWT token
    };
    print(headers);
    try {
      final response = await http.get(
        Uri.parse(
          currentUser,
        ),
        headers: headers,
      );
      // print('Response Status Code: ${response.statusCode}');
      // print('Request URL: $currentUser');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        setState(() {
          user = json.decode(response.body);
        });
      } else if (response.statusCode == 404) {
        // Handle location not found
      } else {
        print('Error loading user');
      }
    } catch (e) {
      print('Error: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return user.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : PlatformScaffold(
            cupertino: (_, __) => CupertinoPageScaffoldData(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('Username'),
                trailing: Icon(
                  CupertinoIcons.settings,
                  size: 28,
                ),
              ),
              body: Card(
                margin: const EdgeInsets.all(0),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.2,
                                backgroundColor: Colors.black26,
                                backgroundImage: NetworkImage(
                                  '${user['profilePicture']}',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          '${user['studentName']}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Index no.: ${user['index']}',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'School: ${user['school']}',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Course: ${user['course']}',
                          style: const TextStyle(
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
