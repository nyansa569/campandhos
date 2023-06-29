import 'package:flutter/material.dart';

class PreviewText extends StatelessWidget {
  final String title;
  final String subtitle;
  const PreviewText({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$title:  ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: subtitle,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
