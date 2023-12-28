import 'package:flutter/material.dart';

class SSearchPage extends StatelessWidget {
  const SSearchPage({super.key});

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
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
        isDense: true,
      ),
    );
  }
}
