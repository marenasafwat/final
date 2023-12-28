// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/activities.dart';
import 'package:flutter_application_1/widgets/activites_widget.dart';

class RStudentAct extends StatelessWidget {
  const RStudentAct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Activites'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("activites").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            children: [
              ...snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                return ActivitiesWidget(
                  activities: Activities.fromMap(data),
                ); // 👈 Your valid data here
              }).toList()
            ],
          );
        },
      ),
    );
  }
}
