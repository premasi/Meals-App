import 'dart:ffi';

import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarianFree,
  veganFree,
}

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FiltersState();
  }
}

class _FiltersState extends State<Filters> {
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFreeFilter = false;
  var _veganFreeFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filter"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarianFree: _vegetarianFreeFilter,
            Filter.veganFree: _veganFreeFilter,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: Text(
                "Gluten-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only gluten-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                "Lactose-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only lactose-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            SwitchListTile(
              value: _vegetarianFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilter = isChecked;
                });
              },
              title: Text(
                "Vegetarian-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only vegetarian-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
            SwitchListTile(
              value: _veganFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilter = isChecked;
                });
              },
              title: Text(
                "Vegan-free",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              subtitle: Text(
                "Only vegan-free meals",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 16, right: 16),
            ),
          ],
        ),
      ),
    );
  }
}
