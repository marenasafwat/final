// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/youth.dart';

class EventPage extends StatelessWidget {
  final Youth youth;
  const EventPage({super.key,  required this.youth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detiails'),
        /* actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],*/
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(youth.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment(0, 0.6)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                // 'Who is ',
                youth.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                youth.description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
