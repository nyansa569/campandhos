import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'screens.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  int currentindex;
  HomeScreen({super.key, this.currentindex = 0});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var screens = const <Widget>[
    NewsScreen(),
    SearchScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        navigationBar: CupertinoNavigationBar(
          trailing: widget.currentindex == 3
              ? PlatformIconButton(
                  onPressed: () {},
                  icon: Icon(
                    PlatformIcons(context).settings,
                    color: Colors.black,
                  ),
                )
              : widget.currentindex == 0
                  ? PlatformIconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => MapsScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        CupertinoIcons.globe,
                        color: Colors.black54,
                      ),
                    )
                  : const SizedBox(width: 0, height: 0),
          leading: const SizedBox(width: 0, height: 0),
          middle: widget.currentindex == 0
              ? const Text("News feed")
              : widget.currentindex == 1
                  ? const Text("Search")
                  : widget.currentindex == 2
                      ? const Text("Notification")
                      : const Text("Accounts"),
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
              PlatformIcons(context).home,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).search,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).dehaze,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              PlatformIcons(context).person,
            ),
          ),
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
