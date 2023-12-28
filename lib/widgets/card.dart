// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onPressed;

  const MyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Color.fromRGBO(206, 216, 241, 0.973),
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: GestureDetector(
          onTap: onPressed,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(imageUrl),
              ),
              const SizedBox(width: 10),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
