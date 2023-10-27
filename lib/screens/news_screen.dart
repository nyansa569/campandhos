import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:http/http.dart' as http;
import '../widgets/news_card.dart';
import 'config.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> news = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    print('Getting news...');
    final response = await http.get(Uri.parse(allNews));

    if (response.statusCode == 200) {
      setState(() {
        news = json.decode(response.body);
      });
      print('done...');
    } else {
      throw Exception('Failed to load locations');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      cupertino: (_, __) => CupertinoPageScaffoldData(
        body: Card(
          margin: const EdgeInsets.all(0),
          child: SafeArea(
            child: ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return NewsCard(
                  schoolName: news[index]['schoolName'],
                  description: news[index]['desc'],
                  date: DateTime.now(),
                  title: news[index]['title'],
                  image: news[index]['imageUrl'],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
