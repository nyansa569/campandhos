import 'package:cnahr/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  final List<Widget> _pages = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/online-reserve copy.png"),
        ),
        Text(
          'Reserve hostel rooms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/find-map-location copy.jpeg"),
        ),
        Text(
          'Navigate to buildings in school and hostels around',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("assets/news-online copy.png"),
        ),
        Text(
          'News updates',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: _pages,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          GestureDetector(
            onTap: () => {
              _currentPage < 2
                  ? _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    )
                  : Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false)
            },
            child: Container(
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: Text(
                _currentPage < 2 ? 'Next' : 'Done',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
