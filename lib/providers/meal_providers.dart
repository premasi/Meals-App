import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data_category.dart';

final mealsProviders = Provider((ref) {
  return dummyMeals;
});
