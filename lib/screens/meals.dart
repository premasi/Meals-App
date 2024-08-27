import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_models.dart';
import 'package:meals_app/widgets/meals_item.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, this.category, required this.listMeals});

  final String? category;
  final List<MealsModels> listMeals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: listMeals.length,
      itemBuilder: (ctx, index) => MealsItem(meals: listMeals[index]),
    );

    if (listMeals.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Meals not found :(",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(height: 16),
            Text("Try search another category",
                style: TextStyle(color: Colors.grey, fontSize: 12))
          ],
        ),
      );
    }

    if (category == null) {
      return content;
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(category!),
        ),
        body: content,
      );
    }
  }
}
