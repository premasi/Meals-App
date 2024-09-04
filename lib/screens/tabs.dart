import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meals_models.dart';
import 'package:meals_app/providers/meal_providers.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/drawer.dart';

const intialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false
};

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<Tabs> {
  int _selectedPageIndex = 0;

  final List<MealsModels> _favoriteMeals = [];

  Map<Filter, bool> _selectedFilters = intialFilters;

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMeals(MealsModels meals) {
    final isExisting = _favoriteMeals.contains(meals);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meals);
      });
      _showSnackBar("Meal remove from favorite");
    } else {
      setState(() {
        _favoriteMeals.add(meals);
      });
      _showSnackBar("Added to favorite");
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result =
          await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(
              builder: (ctx) => Filters(
                    currentFilter: _selectedFilters,
                  )));

      setState(() {
        _selectedFilters = result ?? intialFilters;
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProviders);
    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarianFree]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.veganFree]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteMeals,
      availableMeals: availableMeals,
    );
    var activePageTitle = "Category";
    if (_selectedPageIndex == 1) {
      activePage = Meals(
        listMeals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteMeals,
      );
      activePageTitle = "Favorties";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      drawer: MainDrawer(onSelectScreen: _setScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
      ),
    );
  }
}
