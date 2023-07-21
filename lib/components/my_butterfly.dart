import 'package:flutter/material.dart';

class MyButterfly extends StatelessWidget {
  final Widget? child;
  const MyButterfly({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 65,
      decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(200))),
      child: child!,
    );
  }
}
