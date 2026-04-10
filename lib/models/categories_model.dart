class CategoriesModel {

  String? id;
  String? name;
  String? image;
  String? description;

  CategoriesModel({
    this.id,
    this.name,
    this.image,
    this.description,
  });

  factory CategoriesModel.fromJson( Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['idCategory'] ?? '',
      name: json['strCategory'] ?? '', 
      image: json['strCategoryThumb'] ?? '',
      description: json['strCategoryDescription'] ?? '',
    );
  }

}