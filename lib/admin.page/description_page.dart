// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activities.dart';

class DescriptionPage extends StatelessWidget {
  final Activities activities;
  const DescriptionPage({
    super.key,
    required this.activities,
  });

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
              child: Image.network(activities.image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment(0, 0.6)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activities.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                activities.description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Edit Activity screen
                  /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditActivityScreen(activityId: activities.id),
        ),
      );*/
                },
                child: Text('Edit'),
              ),
            ),
          ],
        ),
      )),
    );
  }
}