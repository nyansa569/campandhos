import 'dart:convert';

import 'package:cnahr/screens/config.dart';
import 'package:cnahr/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final studentIDController = TextEditingController();

  final passwordController = TextEditingController();

  late SharedPreferences prefs;
  bool isloading = false;
  bool showErrorText = false;
  String errorText = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPref();
  }

  void initSharedPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  void loginUser() async {
    setState(() {
      isloading = true;
    });
    print('Loggin in...');

    if (studentIDController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var regBody = {
        "index": studentIDController.text,
        "password": passwordController.text,
      };
      try {
        var response = await http.post(
          Uri.parse(login),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );
        print(response);
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse['status']);
        if (jsonResponse['status']) {
          var myToken = jsonResponse['token'];
          prefs.setString('token', myToken);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(
                token: myToken,
              ),
            ),
            (route) => false,
          );
          setState(() {
            isloading = false;
          });
        } else {
          setState(() {
            isloading = false;
            showErrorText = true;
            errorText = 'Invalid Credentials';
          });
          print('Something went wrong');
        }
      } catch (e) {
        print(e);
        setState(() {
          isloading = false;
          errorText = 'Invalid credentials';
        });
      }
    } else {
      setState(() {
        showErrorText = true;
        errorText = 'Enter ID and password!';
      });
      print('Enter ID and password');
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/GCTU1.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(height: 20),
            InputField(
              labelText: 'Student ID',
              hintText: 'e.g. 040919582',
              controller: studentIDController,
            ),
            SizedBox(height: 20),
            InputField(
              labelText: 'Enter password',
              hintText: 'Enter password',
              controller: passwordController,
              isPass: true,
            ),
            Text(
              showErrorText ? errorText : '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(height: 20),
            SignButton(
                widget: isloading
                    ? CircularProgressIndicator()
                    : Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                onPressed: () => loginUser()),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Having challenges logging in?'),
                Text(
                  'Contact support',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text('Forgot password'),
          ],
        ),
      ),
    );
  }
}
