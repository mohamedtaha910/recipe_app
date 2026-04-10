import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 0) 
class MealModel {
  @HiveField(0)
  final String id ;
  @HiveField(1)
  final String name ;
  @HiveField(2)
  final String image ; 

  MealModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['idMeal'] ?? '',
      name: json['strMeal'] ?? '',
      image: json['strMealThumb'] ?? '',
    );
  }
}