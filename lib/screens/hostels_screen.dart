import 'package:cnahr/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../widgets/widget.dart';
import 'screens.dart';

class HostelsScreen extends StatelessWidget {
  final School sData;
  HostelsScreen({super.key, required this.sData});

  var data = Hostel.hostels;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Browse hostels around ${sData.schoolName}',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Card(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (constex, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailedHostel(
                            hData: data[index],
                          ),
                        ),
                      );
                    },
                    child: ListCard(
                      name: data[index].hostelName,
                      image: data[index].image,
                      description: data[index].description,
                      subSect:
                          '${data[index].hostelRooms.length} rooms available',
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
