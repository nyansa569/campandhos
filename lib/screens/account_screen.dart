import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.black26,
                      // backgroundImage: NetworkImage(
                      //   'https://imagez.tmz.com/image/0d/1by1/2021/09/15/0dd0be941f9f483fbc2065b0409c7685_md.png',
                      // ),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 0,
                      child: Container(
                        // padding: EdgeInsets.all(0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.black54,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_a_photo,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Username',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text(
                'School',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text(
                'Course',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const Text(
                'Student ID',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
