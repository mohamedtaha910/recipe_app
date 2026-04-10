class DetailedMealModel {
  final int id;
  final String name;
  final String category;
  final String country;
  final String instruction;
  final String image;
  final String tags;
  final String video;
  final List<String> ingredients;
  final List<String> quantity;

  DetailedMealModel({
    required this.id,
    required this.name,
    required this.category,
    required this.country,
    required this.instruction,
    required this.image,
    required this.tags,
    required this.video,
    required this.ingredients,
    required this.quantity,
  });
  factory DetailedMealModel.fromJson(json) {
    return DetailedMealModel(
      id: int.parse(json['idMeal'] ?? 0),
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      country: json['strArea'] ?? '',
      instruction: json['strInstructions'] ?? '',
      image: json['strMealThumb'] ?? '',
      tags: json['strTags'] ?? '',
      video: json['strYoutube'] ?? '',
      ingredients: [
        json['strIngredient1'] ?? '',
        json['strIngredient2'] ?? '',
        json['strIngredient3'] ?? '',
        json['strIngredient4'] ?? '',
        json['strIngredient5'] ?? '',
        json['strIngredient6'] ?? '',
        json['strIngredient7'] ?? '',
        json['strIngredient8'] ?? '',
        json['strIngredient9'] ?? '',
        json['strIngredient10'] ?? '',
        json['strIngredient11'] ?? '',
        json['strIngredient12'] ?? '',
        json['strIngredient13'] ?? '',
        json['strIngredient14'] ?? '',
        json['strIngredient15'] ?? '',
        json['strIngredient16'] ?? '',
        json['strIngredient17'] ?? '',
        json['strIngredient18'] ?? '',
        json['strIngredient19'] ?? '',
        json['strIngredient20'] ?? '',
      ],
      quantity: [
        json['strMeasure1'] ?? '',
        json['strMeasure2'] ?? '',
        json['strMeasure3'] ?? '',
        json['strMeasure4'] ?? '',
        json['strMeasure5'] ?? '',
        json['strMeasure6'] ?? '',
        json['strMeasure7'] ?? '',
        json['strMeasure8'] ?? '',
        json['strMeasure9'] ?? '',
        json['strMeasure10'] ?? '',
        json['strMeasure11'] ?? '',
        json['strMeasure12'] ?? '',
        json['strMeasure13'] ?? '',
        json['strMeasure14'] ?? '',
        json['strMeasure15'] ?? '',
        json['strMeasure16'] ?? '',
        json['strMeasure17'] ?? '',
        json['strMeasure18'] ?? '',
        json['strMeasure19'] ?? '',
        json['strMeasure20'] ?? '',
      ],
    );
  }
}
