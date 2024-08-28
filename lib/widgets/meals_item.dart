import 'package:flutter/material.dart';
import 'package:meals_app/models/meals_models.dart';
import 'package:meals_app/screens/meals_details.dart';
import 'package:meals_app/widgets/meals_item_traits.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsItem extends StatelessWidget {
  const MealsItem(
      {super.key, required this.meals, required this.onToggleFavorite});
  final MealsModels meals;
  final void Function(MealsModels meals) onToggleFavorite;

  String get complexityString {
    return meals.complexity.name[0].toUpperCase() +
        meals.complexity.name.substring(1);
  }

  String get affordableString {
    return meals.affordability.name[0].toUpperCase() +
        meals.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.hardEdge,
      elevation: 8,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => MealsDetails(
                      meals: meals, onToggleFavorite: onToggleFavorite)));
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meals.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        meals.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MealsItemTraits(
                              icon: Icons.schedule,
                              label: "${meals.duration} min"),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsItemTraits(
                              icon: Icons.work, label: "$complexityString min"),
                          const SizedBox(
                            width: 12,
                          ),
                          MealsItemTraits(
                              icon: Icons.money, label: affordableString),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
