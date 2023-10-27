import 'package:cnahr/screens/config.dart';
import 'package:cnahr/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String? token = pref.getString('token');

  if (token != null) {
    runApp(
      MyApp(token: token),
    );
  } else {
    runApp(MyAppAnd());
  }
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({required this.token, super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (JwtDecoder.isExpired(token) == false)
          ? SplashScreen(nextscreen: HomeScreen(token: token))
          : SplashScreen(nextscreen: SliderPage()),
      routes: {
        '/notification': (context) => HomeScreen(
              token: token,
              currentindex: 2,
            ),
      },
    );
  }
}

class MyAppAnd extends StatelessWidget {
  const MyAppAnd({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
