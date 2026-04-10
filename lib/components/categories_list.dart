import 'package:flutter/material.dart';
// import 'package:recipe_app/constant.dart';
import 'package:recipe_app/models/categories_model.dart';
import 'package:recipe_app/screens/category_meals.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/shimmers/categories_shimmer.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeServices().getCategories(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return CategoriesShimmer();
        } else if (snapShot.hasError) {
          return Center(child: Text(snapShot.error.toString()));
        } else if (snapShot.data == null) {
          return Center(child: Text('No Data'));
        } else if (snapShot.hasData) {
          List<CategoriesModel> categories = snapShot.data!;
          return SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                CategoriesModel category = categories[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryMeals(category: category,),));
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: kLightColor.withAlpha(100),
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                    
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: category.image!.isEmpty
                              ? Image.asset(
                                  'assets/images/images.jpg',
                                  fit: BoxFit.cover,
                                )
                              : Image.network(category.image!, fit: BoxFit.cover),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${category.name}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Center(child: Text('No Data'));
        }
      },
    );
  }
}
