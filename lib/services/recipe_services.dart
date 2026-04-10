import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/models/categories_model.dart';
import 'package:recipe_app/models/detailed_meal_model.dart';
import 'package:recipe_app/models/meal_model.dart';

class RecipeServices {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<CategoriesModel>> getCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories.php'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<CategoriesModel> categories = [];
      for (var category in data['categories']) {
        categories.add(CategoriesModel.fromJson(category));
      }
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<String>> getCountries() async {
    final response = await http.get(Uri.parse('$baseUrl/list.php?a=list'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<String> countries = [];
      for (var country in data['meals']) {
        countries.add(country['strArea']);
      }
      return countries;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  Future<List<MealModel>> getMealsByCountry(String country) async {
    final response = await http.get(
      Uri.parse('$baseUrl/filter.php?a=$country'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      List<MealModel> meals = [];
      for (var meal in data['meals']) {
        meals.add(MealModel.fromJson(meal));
      }
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<List<MealModel>> getMealsByCategory(String category) async {
    final response = await http.get(
      Uri.parse('$baseUrl/filter.php?c=$category'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<MealModel> meals = [];
      for (var meal in data['meals']) {
        meals.add(MealModel.fromJson(meal));
      }
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<DetailedMealModel> getMealDetails(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/lookup.php?i=$id'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      late DetailedMealModel meal;
      for (var item in data['meals']) {
        meal = DetailedMealModel.fromJson(item);
      }
      return meal;
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<List<MealModel>> searchMeals(String mealName) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search.php?s=$mealName'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<MealModel> meals = [];
      for (var meal in data['meals']) {
        meals.add(MealModel.fromJson(meal));
      }
      return meals;
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
