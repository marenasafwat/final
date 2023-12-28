// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, use_build_context_synchronously, non_constant_identifier_names, unnecessary_new, unused_local_variable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/h_screen.dart';
import 'package:flutter_application_1/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isObscure3 = true;
  bool visible = false;
  final _formKey = GlobalKey<FormState>();

  void logUserIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        route();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          WrongEmailMassage();
        } else if (e.code == 'wrong-password') {
          WrongPasswordMassage();
        }
      }
    }
  }

  void WrongEmailMassage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  void WrongPasswordMassage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Incorrect Password'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromRGBO(0, 57, 202, 0.98),
          Color.fromARGB(255, 116, 211, 255),
          Colors.white
        ])),
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
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome back:)",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ]),
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
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
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
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  //email
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Email cannot be empty";
                                      }
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please enter a valid email");
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      emailController.text = value!;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  //user
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "User Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade200))),
                                  //password
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: _isObscure3,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                            icon: Icon(_isObscure3
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _isObscure3 = !_isObscure3;
                                              });
                                            }),
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                    validator: (value) {
                                      RegExp regex = new RegExp(r'^.{6,}$');
                                      if (value!.isEmpty) {
                                        return "Password cannot be empty";
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("please enter valid password min. 6 character");
                                      } else {
                                        return null;
                                      }
                                    },
                                    onSaved: (value) {
                                      passwordController.text = value!;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 57, 202, 0.98),
                                      offset: Offset(0, 4),
                                      blurRadius: 5.0)
                                ],
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    colors: [
                                      Color.fromRGBO(0, 57, 202, 0.98),
                                      Color.fromARGB(255, 116, 211, 255),
                                      Colors.white
                                    ]),
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.shade700),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(60.0),
                                  ),
                                ),
                                minimumSize: MaterialStateProperty.all(
                                    const Size(330, 50)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              //press
                              onPressed: () {
                                setState(() {
                                  visible = true;
                                });
                                logUserIn(emailController.text,
                                    passwordController.text);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> Store =
            documentSnapshot.data() as Map<String, dynamic>;
        print('This is the type of user ${Store['role']}');
        if (Store['role'] == 'student') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }
}
