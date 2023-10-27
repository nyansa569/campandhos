import 'dart:convert';

import 'package:cnahr/screens/config.dart';
import 'package:cnahr/widgets/slide_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RoomScreen extends StatefulWidget {
  final String roomID;
  const RoomScreen({super.key, required this.roomID});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  Map<String, dynamic> room = {};
  double value = 0;
  bool isAccept = false;

  bool showError = false;

  @override
  void initState() {
    super.initState();
    fetchRoomDetails(widget.roomID);
  }

  void createBooking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Creating booking...');
    if (room.isNotEmpty) {
      var regBody = {
        "hostelName": "${room['hostelName']}",
        "roomName": "${room['roomName']}",
        "price": 'GHC${room['price']}.00',
        "roomDesc": "${room['roomDesc']}",
        "schoolName": "${room['schoolName']}"
      };
      // print(regBody);
      try {
        var response = await http.post(
          Uri.parse(booking),
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(regBody),
        );
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        if (jsonResponse == 'invalid token') {
          Navigator.of(context).pop();
        } else {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/notification',
            (Route<dynamic> route) => false,
          );
        }
      } catch (e) {
        print("Network error: " + e.toString());
      }
    }
  }

  Future<void> fetchRoomDetails(String roomID) async {
    final response = await http.get(Uri.parse(singleRoom + roomID));
    print('Getting room...');

    if (response.statusCode == 200) {
      setState(() {
        room = json.decode(response.body);
      });
    } else if (response.statusCode == 404) {
      // Handle location not found
    } else {
      print('Error loading hostel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return room.isEmpty
        ? Center(child: CircularProgressIndicator())
        : PlatformScaffold(
            cupertino: (_, __) => CupertinoPageScaffoldData(
              navigationBar: CupertinoNavigationBar(
                middle: Text(
                  '${room['roomName']}',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            body: Card(
              elevation: 0,
              color: Colors.transparent,
              margin: EdgeInsets.all(0),
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hostel name:'),
                      Text(
                        '${room['hostelName']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Name of the school closest to:'),
                      Text(
                        '${room['schoolName']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Room name:'),
                      Text(
                        '${room['roomName']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Room description'),
                      Text(
                        '${room['roomDesc']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Price:'),
                      Text(
                        'GHC${room['price']}.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Availability:'),
                      Text(
                        room['availability']
                            ? 'Yes, there is space available'
                            : 'Sorry, this room is occupied',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.height * 0.019,
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      CustomSliderWidget(
                        booked: () async {
                          return await comfirmPickUp(
                              context, '${room['hostelName']}');
                        },
                        value: value,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Future<void> comfirmPickUp(BuildContext context, String hostelName) {
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return CupertinoAlertDialog(
            title: const Text(
              "Order confirmation",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            content: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  // color: Colors.amber,
                  child: Text(
                    'Please read these Terms and Conditions carefully before using our hostel reservation booking platform. These Terms and Conditions constitute a legal agreement between and $hostelName. By using our Platform, you agree to comply with and be bound by these Terms and Conditions. If you do not agree with these Terms and Conditions, please do not use our Platform.',
                    textAlign: TextAlign.left,
                    maxLines: 12,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.015,
                    ),
                  ),
                ),
                Card(
                  shadowColor: Colors.transparent,
                  color: Colors.white70,
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const SizedBox(
                      height: 40,
                      width: 50,
                      child: Text(
                        "Accept our terms and conditions",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    value: isAccept,
                    onChanged: (checked) {
                      // print(isAccept.toString());
                      setState(() {
                        isAccept = !isAccept;
                      });
                    },
                  ),
                ),
                showError == true
                    ? Text(
                        'You must accept our terms and conditions to proceed',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.height * 0.012,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  setState(() {
                    value = 0;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("close"),
              ),
              CupertinoDialogAction(
                isDestructiveAction: false,
                onPressed: isAccept
                    ? () => createBooking()
                    : () {
                        setState(() {
                          showError = true;
                        });
                      },
                child: const Text("Confirm"),
              ),
            ],
          );
        });
      },
    );
  }
}
