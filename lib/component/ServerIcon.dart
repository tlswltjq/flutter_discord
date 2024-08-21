import 'package:flutter/material.dart';

class ServerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  ServerButton({required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}