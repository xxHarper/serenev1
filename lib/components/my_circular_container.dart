import 'package:flutter/material.dart';

class MyCircularContainer extends StatelessWidget {
  final double size;
  final Color back;
  final Widget? child;

  const MyCircularContainer(
      {Key? key, required this.size, required this.back, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: back),
      child: child!,
    );
  }
}
