// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color? color;

  const CustomIconButton({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.onTap,
    this.color = const Color.fromARGB(255, 116, 211, 255),
    required int hight,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        child: Align(
          // Use Align to position the child at the start
          alignment: Alignment.centerLeft,
          child: child,
        ),
        onTap: onTap,
      ),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            blurRadius: 2.0,
            spreadRadius: .05,
          ),
        ],
      ),
    );
  }
}
