import 'package:cnahr/screens/screens.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class DetailedHostel extends StatefulWidget {
  final Hostel hData;
  const DetailedHostel({super.key, required this.hData});

  @override
  State<DetailedHostel> createState() => _DetailedHostelState();
}

class _DetailedHostelState extends State<DetailedHostel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.width * 0.66,
            decoration: BoxDecoration(
              color: Colors.white,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(widget.hData.image),
              // ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Text(
                      widget.hData.hostelName,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      widget.hData.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.width * 0.5,
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    color: Colors.black12,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.hData.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.45,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(12),
                            // image: DecorationImage(
                            //   fit: BoxFit.cover,
                            //   image: NetworkImage(
                            //     widget.hData.images[index],
                            //   ),
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RoomScreen(
                                hData: widget.hData,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Text(
                              'View all available rooms',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
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
                color: Colors.black26,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
