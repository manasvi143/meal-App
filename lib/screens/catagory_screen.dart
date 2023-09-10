import 'package:flutter/material.dart';
import 'package:meals_app/model/catagory.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';

import 'package:meals_app/widgets/catagory_grid_item.dart';

import '../data/dummy_catagory.dart';

class CatagoryScreen extends StatefulWidget {
  const CatagoryScreen(
      {super.key, required this.toggleFavourite, required this.availableMeals});

  final void Function(Meal meal) toggleFavourite;
  final List<Meal> availableMeals;

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 0,
      // upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCatagory(BuildContext context, Category category) {
    final filterdMeal = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealScreen(
          title: category.title,
          meals: filterdMeal,
          toggleFavourite: widget.toggleFavourite),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      builder: (context, child) =>
          // Padding(
          //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
          //   child: child,
          // ),
          SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
