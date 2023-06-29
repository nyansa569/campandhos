import 'package:cnahr/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../models/models.dart';
import '../widgets/widget.dart';

class SchoolsScreen extends StatelessWidget {
  final City cData;

  SchoolsScreen({required this.cData, super.key});

  var data = School.schools;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          middle: PlatformText('Browse schools in ${cData.cityName}'),
        ),
        body: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (constex, index) {
                if (cData.cityName == data[index].city) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HostelsScreen(
                            sData: data[index],
                          ),
                        ),
                      );
                    },
                    child: ListCard(
                      name: data[index].schoolName,
                      image: data[index].image,
                      description: data[index].description,
                      subSect:
                          '${data[index].schoolHostels.length} hostels available',
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
