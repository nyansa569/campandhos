import 'package:cnahr/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../models/models.dart';
import '../widgets/widget.dart';

class RoomScreen extends StatefulWidget {
  final Hostel hData;

  const RoomScreen({super.key, required this.hData});

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  var rData = Room.rooms;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: PlatformText(
            'Available rooms in ${widget.hData.hostelName}',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
      body: Card(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: .0),
            child: ListView.builder(
              itemCount: rData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => RoomBooking(),
                      ),
                    );
                  },
                  child: RoomCard(
                    name: rData[index].roomName,
                    studentPerRoom:
                        '${rData[index].studentsInARoom} students/room',
                    bathRoom: rData[index].bathroom ? 'Bathroom available' : '',
                    kitchen: rData[index].kitchen ? 'Kitchen available' : '',
                    image: rData[index].image,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
