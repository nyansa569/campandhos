import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final Function() onPressed;
  final Widget widget;
  const SignButton({
    required this.onPressed,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          MediaQuery.of(context).size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: widget,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
