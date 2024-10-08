import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals_models.dart';

class FavoriteMealsNotifier extends StateNotifier<List<MealsModels>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleFavoriteStatus(MealsModels meal) {
    final isFavorite = state.contains(meal);

    if (isFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<MealsModels>>((ref) {
  return FavoriteMealsNotifier();
});
