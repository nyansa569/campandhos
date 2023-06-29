import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final String subSect;
  const ListCard({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.subSect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.30,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.24,
            height: MediaQuery.of(context).size.width * 0.24,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: NetworkImage(image),
              // ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Expanded(child: SizedBox()),
                Text(subSect)
              ],
            ),
          )
        ],
      ),
    );
  }
}
