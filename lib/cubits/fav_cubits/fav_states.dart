import 'package:flutter/material.dart';
import 'package:recipe_app/models/meal_model.dart';

@immutable
abstract class FavStates {}

class FavInitial extends FavStates {}

class FavLoading extends FavStates {}

class FavSuccess extends FavStates {
  final List<MealModel> favMeals;
  FavSuccess({required this.favMeals});
}

class FavNull extends FavStates {
  final String errMessage;

  FavNull({required this.errMessage});
}
