import 'dart:convert';
import 'package:cnahr/screens/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

// import '../widgets/widget.dart';
import 'screens.dart';

class HostelsScreen extends StatefulWidget {
  const HostelsScreen({
    super.key,
  });

  @override
  State<HostelsScreen> createState() => _HostelsScreenState();
}

class _HostelsScreenState extends State<HostelsScreen> {
  List<dynamic> locations = [];

  @override
  void initState() {
    super.initState();
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    print('Getting locations...');
    final response = await http.get(Uri.parse(allHostels));

    if (response.statusCode == 200) {
      setState(() {
        locations = json.decode(response.body);
      });
      print('done...');
    } else {
      throw Exception('Failed to load locations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        body: Card(
          elevation: 0,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => DetailedHostel(
                            hostelID: locations[index]['_id'],
                            hostelName: locations[index]['hostelName'],
                          ),
                        ),
                      );
                    },
                    child: HostelsCard(
                      hostelName: locations[index]['hostelName'],
                      img: locations[index]['imageUrl'],
                      // description: locations[index]['description'],
                      description: locations[index]['description'],
                      roomsAvailable: locations[index]['numberOfRooms'],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HostelsCard extends StatelessWidget {
  final String hostelName;
  final String description;
  final int roomsAvailable;
  final String img;
  const HostelsCard({
    super.key,
    required this.hostelName,
    required this.description,
    required this.roomsAvailable,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      hostelName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.67,
                height: MediaQuery.of(context).size.height * 0.06,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.018,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              Text(
                '${roomsAvailable} available rooms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.016,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
