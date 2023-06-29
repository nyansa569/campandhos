import 'package:flutter/material.dart';

import '../models/models.dart';

class CategoryCard extends StatelessWidget {
  final BuildContext context;
  final int index;
  const CategoryCard({
    super.key,
    required this.context,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var data = City.cities;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
            // image: DecorationImage(
            //   image: NetworkImage(data[index].image),
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.45,
          height: MediaQuery.of(context).size.width * 0.45,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 189, 189, 189),
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black87,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data[index].cityName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
