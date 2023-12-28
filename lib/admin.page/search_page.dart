// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
   return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 26,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: 'Search your topic',
        labelStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        isDense: true,
      ),
    );
  }
}