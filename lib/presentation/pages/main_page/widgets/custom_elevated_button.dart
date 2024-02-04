import 'package:flutter/material.dart';

@immutable
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final buttonColor = MaterialStateProperty.all(Colors.black26);
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shadowColor: buttonColor,
          overlayColor: buttonColor,
          backgroundColor: buttonColor,
          foregroundColor: buttonColor,
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ));
  }
}
