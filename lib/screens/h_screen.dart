// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/student.page/shome_page.dart';
import 'package:flutter_application_1/student.page/sprofile_page.dart';
import 'package:flutter_application_1/student.page/ssearch_page.dart';
import 'package:flutter_application_1/admin.page/favorite_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HScreen extends StatefulWidget {
  const HScreen({super.key});

  @override
  State<HScreen> createState() => _HScreenState();
}

class _HScreenState extends State<HScreen> {
  List<Widget> listoptions = <Widget>[
    SHomePage(),
    Favorites(),
    SSearchPage(),
    SProfilePage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: listoptions[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(0, 57, 202, 0.98),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Color.fromRGBO(0, 57, 202, 0.98),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 116, 211, 255),
            gap: 8,
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
