import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;
  final Color back;

  const MyFloatingActionButton(
      {super.key, required this.onPressed, required this.back});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: back,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
