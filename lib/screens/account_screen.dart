import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Username'),
          trailing: Icon(
            CupertinoIcons.settings,
            size: 28,
          ),
        ),
        body: const Card(
          margin: EdgeInsets.all(0),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.black26,
                          // backgroundImage: NetworkImage(
                          //   'https://imagez.tmz.com/image/0d/1by1/2021/09/15/0dd0be941f9f483fbc2065b0409c7685_md.png',
                          // ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'School',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Course',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Student ID',
                    style: TextStyle(
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
