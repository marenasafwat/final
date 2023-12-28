// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

class YouthCare extends StatefulWidget {
  @override
  State<YouthCare> createState() => _YouthCoreState();
}

class _YouthCoreState extends State<YouthCare> {
  String? selectedActivity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students Assistant'),
        backgroundColor: Color.fromRGBO(67, 149, 255, 0.808),
      ),
      body: Container(
        width: double.infinity,
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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 80),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Youth Core",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "to get started now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Form(
                        // key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(27, 83, 225, 0.992),
                                    blurRadius: 20,
                                    offset: Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    // onPressed: () async {
                                    //   // Navigator.push(
                                    //   //   context,
                                    //   //   MaterialPageRoute(builder: (context) => YouthCore()),
                                    //   // );
                                    // },
                                    child: Container(
                                      height: 150,
                                      width: 1000,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Color.fromARGB(
                                              255, 230, 234, 236)),
                                      child: Center(
                                        child: Text(
                                          "Youth Core ",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 74, 179, 255),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Student activities, also known as campus activities, are student-focused extracurricular clubs and programs offered at'
                                    'a college or university. Student activities are generally designed to allow students to become more'
                                    'involved on campus. Often, these activities provide students with opportunities to develop leadership'
                                    'skills, social responsibility, citizenship.',
                                    style: TextStyle(
                                      color: Color.fromARGB(240, 0, 0, 0),
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
