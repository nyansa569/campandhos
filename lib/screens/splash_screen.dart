import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextscreen;
  const SplashScreen({required this.nextscreen, super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => widget.nextscreen),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: SizedBox()),
            Hero(
              tag: 'logo',
              child: Image.asset('assets/GCTU1.png'),
            ),
            SizedBox(height: 15),
            Text(
              'Hostel booking and student navigation app',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
            Expanded(child: SizedBox()),
            Text('Powered by Michael And Kwesi'),
          ],
        ),
      ),
    );
  }
}
