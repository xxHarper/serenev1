import 'package:flutter/material.dart';

class MySimpleContainer extends StatefulWidget {
  final Color lightBackground;
  final Widget? child;
  final double padding;
  final double marginV;
  final double borderRadius;

  const MySimpleContainer(
      {Key? key,
      required this.lightBackground,
      this.marginV = 5,
      this.padding = 12,
      this.borderRadius = 15,
      required this.child})
      : super(key: key);

  @override
  _MySimpleContainerState createState() => _MySimpleContainerState();
}

class _MySimpleContainerState extends State<MySimpleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: widget.marginV),
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
          color: widget.lightBackground,
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: widget.child!,
    );
  }
}
