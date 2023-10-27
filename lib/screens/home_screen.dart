import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'screens.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int currentindex;
  final token;
  HomeScreen({super.key, this.currentindex = 0, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var screens = <Widget>[
    NewsScreen(),
    MapsScreen(),
    HostelsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: widget.currentindex == 1
            ? null
            : CupertinoNavigationBar(
                trailing: widget.currentindex == 3
                    ? PlatformIconButton(
                        onPressed: () {},
                        icon: Icon(
                          PlatformIcons(context).settings,
                          color: Colors.black,
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
                leading: widget.currentindex == 0
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => AccountScreen(
                                token: widget.token,
                              ),
                            ),
                          );
                        },
                        child: Icon(
                          PlatformIcons(context).person,
                          size: 30,
                        ),
                      )
                    : const SizedBox(width: 0, height: 0),
                middle: widget.currentindex == 0
                    ? const Text("News feed")
                    : const Text("Hostels"),
              ),
      ),
      body: IndexedStack(
        index: widget.currentindex,
        children: screens,
      ),
      bottomNavBar: PlatformNavBar(
        currentIndex: widget.currentindex,
        itemChanged: (value) => setState(() => widget.currentindex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.news_solid,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.globe,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).home,
            ),
          ),
          //  ]
        ],
        material: (_, __) => MaterialNavBarData(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          itemChanged: (value) => setState(() => widget.currentindex = value),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
