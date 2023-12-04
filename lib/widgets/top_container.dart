import 'package:flutter/material.dart';
import 'package:taskplanner/warna/light_colors.dart';

class TopContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final EdgeInsets padding;
  TopContainer({required this.height, required this.width, required this.child, required this.padding});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(75)),
          color: Color (0xFF00CA7D),
      ),
      width: width,
      child: child,
    );
  }
}
