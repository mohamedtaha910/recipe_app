import 'package:flutter/material.dart';
import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/models/categories_model.dart';
// import 'package:recipe_app/models/meal_model.dart';
// import 'package:recipe_app/screens/meal_details.dart';
import 'package:recipe_app/services/recipe_services.dart';
// import 'package:recipe_app/models/meal_model.dart';

class CategoryMeals extends StatelessWidget {
  const CategoryMeals({super.key, required this.category});
  final CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // SizedBox(width: 8,),
            IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
            // SizedBox(width: 10,),
            Text('${category.name}',style: TextStyle(fontWeight: FontWeight.bold),),
            Text(' Meals',style: TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      
      body: MealsGrid(future: RecipeServices().getMealsByCategory(category.name!))
    );
  }
}