import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_catagory.dart';

final mealProvider = Provider((ref) => dummyMeals);
