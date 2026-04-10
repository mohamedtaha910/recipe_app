import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:recipe_app/components/categories_list.dart';
// import 'package:recipe_app/components/countries_list.dart';
import 'package:recipe_app/components/meals_grid.dart';
import 'package:recipe_app/components/search_bar.dart';
import 'package:recipe_app/constant.dart';
import 'package:recipe_app/models/categories_model.dart';
import 'package:recipe_app/screens/discover_page.dart';
// import 'package:recipe_app/screens/category_meals.dart';
// import 'package:recipe_app/screens/search_page.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/shimmers/categories_shimmer.dart';
// import 'package:recipe_app/constant.dart';
// import 'package:recipe_app/models/categories_model.dart';
// import 'package:recipe_app/services/recipe_services.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  late String currentCategory = 'Beef';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                SvgPicture.asset('assets/icons/Group.svg'),
                SizedBox(width: 5),
                SvgPicture.asset('assets/text/Good Morning.svg'),
                Spacer(),
                SvgPicture.asset(
                  'assets/icons/Profile.svg',
                  colorFilter: ColorFilter.mode(
                    Colors.black87,
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 2),
            Text(
              'Mohamed taha',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            // search bar
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => DiscoverPage(isInHomePage: true,)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric( horizontal: 6.0),
                child: CustomSearchBar(),
              ),
            ),

            SizedBox(height: 26),
            // SizedBox(height: 10,),
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),
            // CategoriesList(),
            FutureBuilder(
              future: RecipeServices().getCategories(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text(snapShot.error.toString()));
                } else if (snapShot.data == null) {
                  return CategoriesShimmer();
                } else if (snapShot.hasData) {
                  List<CategoriesModel> categories = snapShot.data!;
                  // currentCategory = categories[0].name!;

                  return SizedBox(
                    height: 55,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        CategoriesModel category = categories[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentCategory = category.name!;
                            });
                            // print(currentCategory);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         CategoryMeals(category: category),
                            //   ),
                            // );
                          },
                          child: Container(
                            // height: 150,
                            // width: 150,
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              // color: kLightColor.withAlpha(100),
                              color: category.name == currentCategory
                                  ? kPrimaryColor.withAlpha(230)
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              '${category.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return CategoriesShimmer();
                }
              },
            ),

            SizedBox(height: 16),
            Expanded(
              child: MealsGrid(
                future: RecipeServices().getMealsByCategory(currentCategory),
              ),
            ),

            // Text(
            //   'Countries',
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(height: 10),
            // CountriesList(),
            // SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
