import 'package:flutter/material.dart';
import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/models/meal_model.dart';
// import 'package:recipe_app/screens/meal_details.dart';
import 'package:recipe_app/services/recipe_services.dart';

class CountryMeals extends StatelessWidget {
  const CountryMeals({super.key, required this.country});
  final String country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 184, 240, 230),
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // SizedBox(width: 8,),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            // SizedBox(width: 10,),
            Text(
              country.toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(' Meals', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MealsGrid(future: RecipeServices().getMealsByCountry(country)),
      ),
    );
  }
}
