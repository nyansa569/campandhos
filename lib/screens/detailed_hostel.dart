import 'package:cnahr/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart';

class DetailedHostel extends StatefulWidget {
  final String hostelID;
  final String hostelName;
  const DetailedHostel({
    super.key,
    required this.hostelID,
    required this.hostelName,
  });

  @override
  State<DetailedHostel> createState() => _DetailedHostelState();
}

class _DetailedHostelState extends State<DetailedHostel> {
  Map<String, dynamic> location = {};
  List<dynamic> rooms = [];

  @override
  void initState() {
    super.initState();
    fetchLocationDetails(widget.hostelID);
    fetchRooms(widget.hostelName);
  }

  Future<void> fetchRooms(String hostelName) async {
    print('Getting rooms...');
    final response = await http.get(Uri.parse(allRooms + hostelName));

    if (response.statusCode == 200) {
      setState(() {
        rooms = json.decode(response.body);
      });
      print('done...');
    } else {
      throw Exception('Failed to load locations');
    }
  }

  Future<void> fetchLocationDetails(String locationId) async {
    final response = await http.get(Uri.parse(singleHostel + locationId));
    print('Getting hostel...');

    if (response.statusCode == 200) {
      setState(() {
        location = json.decode(response.body);
      });
    } else if (response.statusCode == 404) {
      // Handle location not found
    } else {
      print('Error loading hostel');
    }
  }

  @override
  Widget build(BuildContext context) {
    return location.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.66,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('${location['imageUrl']}'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    // padding: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.75,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: Text(
                            '${location['hostelName']}',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '${location['description']}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          'View all rooms',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.height * 0.01,
                          ),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: rooms.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => RoomScreen(
                                        roomID: rooms[index]['_id'],
                                      ),
                                    ),
                                  );
                                },
                                child: RoomsCard(
                                  hostelName: rooms[index]['hostelName'],
                                  description: rooms[index]['roomDesc'],
                                  img: rooms[index]['imageurl'],
                                  roomName: rooms[index]['roomName'],
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class RoomsCard extends StatelessWidget {
  final String img;
  final String hostelName;
  final String roomName;
  final String description;
  const RoomsCard({
    super.key,
    required this.hostelName,
    required this.roomName,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.height * 0.01,
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.height * 0.1,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(img),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.016,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  hostelName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.014,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Click to view details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
