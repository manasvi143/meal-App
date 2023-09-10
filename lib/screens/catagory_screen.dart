import 'package:flutter/material.dart';
import 'package:meals_app/model/catagory.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';

import 'package:meals_app/widgets/catagory_grid_item.dart';

import '../data/dummy_catagory.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen(
      {super.key, required this.toggleFavourite, required this.availableMeals});

  final void Function(Meal meal) toggleFavourite;
  final List<Meal> availableMeals;

  void _selectCatagory(BuildContext context, Category category) {
    final filterdMeal = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
          title: category.title,
          meals: filterdMeal,
          toggleFavourite: toggleFavourite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Select a catagory'),
      // ),
      body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            // alternative of map

            for (final temp in availableCategories)
              CatagoryGridItem(
                  catagory: temp,
                  onSelectCategory: () {
                    _selectCatagory(context, temp);
                  }),
          ]),
    );
  }
}
