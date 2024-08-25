import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Select category"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 100,
            mainAxisSpacing: 100),
        children: const [
          Text(
            "1",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "2",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "3",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "4",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "5",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "6",
            style: TextStyle(color: Colors.red),
          ),
          Text(
            "7",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
