import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data_category.dart';
import 'package:meals_app/widgets/grid_category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Select category"),
      ),
      body: GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        children: [
          for (final category in availableCategories)
            GridCategoryItem(category: category)
        ],
      ),
    );
  }
}
