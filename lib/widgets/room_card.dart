import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final String name;
  final String studentPerRoom;
  final String bathRoom;
  final String kitchen;
  final String image;

  const RoomCard({
    super.key,
    required this.name,
    required this.studentPerRoom,
    required this.bathRoom,
    required this.kitchen,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.35,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.28,
            height: MediaQuery.of(context).size.width * 0.28,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
              // image: DecorationImage(
              //   image: NetworkImage(image),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                studentPerRoom,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                bathRoom,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                kitchen,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
