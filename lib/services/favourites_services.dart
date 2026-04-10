import 'package:recipe_app/models/meal_model.dart';
import 'package:hive_flutter/adapters.dart';

class FavouritesServices {

  final Box<MealModel> box = Hive.box<MealModel>('fav');

  bool isFavourite(String id) => box.containsKey(id);


  /// Add or remove movie from favourites
  void addFavourite(MealModel meal) {
    if (isFavourite(meal.id)) {
      box.delete(meal.id);
    } else {
      box.put(meal.id, meal);
    }
  }

  /// Get all favourite movies
  List<MealModel> getAllFavourites() {
    List<MealModel> favourites = [];
    for (var item in box.values) {
      favourites.add(item);
    }
    return favourites;
  }

}