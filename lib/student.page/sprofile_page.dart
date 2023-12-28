// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SProfilePage extends StatelessWidget {
  SProfilePage({
    super.key,
  });
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser!.uid)
        .get();
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(0, 57, 202, 0.98),
              Color.fromARGB(255, 116, 211, 255),
              Colors.white
            ],
          ),
        ),
      ),
      Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          actions: [
            IconButton(onPressed: logout, icon: Icon(Icons.logout)),
          ],
        ),
        backgroundColor: const Color.fromARGB(0, 255, 254, 254),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            future: getUserDetails(),
            builder: (context, snapshot) {
              //error
              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              }
              //data received
              else if (snapshot.hasData) {
                //extract data
                Map<String, dynamic>? user = snapshot.data!.data();
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //pic
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: EdgeInsets.all(25),
                        child: Icon(
                          Icons.person,
                          size: 64,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //username
                      Text(
                        user!['name'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //email
                      Text(user['email']),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      )
    ]);
  }
}
