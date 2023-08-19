import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        body: Card(
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (_, __) => PostCard(
                  schoolName: 'Name of the school',
                  description:
                      'Somethinrr else as the description and many more tha can be used so we are going to do things that would helo our status',
                  date: DateTime.now().hour,
                  title: 'Something as the title',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
