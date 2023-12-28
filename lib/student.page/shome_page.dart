// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/student.page/readstudent.dart';

class SHomePage extends StatelessWidget {
  const SHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(),
        Text(
          ' Explor more with \nStudents Assistant',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Card(
          color: Colors.white,
          shadowColor: Color.fromRGBO(206, 216, 241, 0.973),
          elevation: 9,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                /* Image.network(
                  "https://i.pinimg.com/564x/90/66/4c/90664cab760b7192ca4fa38379741021.jpg",
                  width: 100,
                  height: 100,
                ),*/
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Student Activites",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RStudentAct()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Card(
          color: Colors.white,
          shadowColor: Color.fromRGBO(206, 216, 241, 0.973),
          elevation: 9,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.all(25),
            child: Row(
              children: [
                /*Image.network(
                  "https://example.com/image.png",
                  width: 100,
                  height: 100,
                ),*/
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Youth Care",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RStudentAct()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 57, 202, 0.98),
            Color.fromARGB(255, 116, 211, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, \n Ree',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ]),
      ]),
    );
  }
}
