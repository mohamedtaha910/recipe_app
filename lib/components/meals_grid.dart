import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:recipe_app/constant.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_cubits.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/meal_details_page.dart';
import 'package:recipe_app/services/favourites_services.dart';
import 'package:recipe_app/shimmers/meals_grid_shimmer.dart';
// import 'package:recipe_app/services/recipe_services.dart';

class MealsGrid extends StatefulWidget {
  const MealsGrid({super.key, required this.future});
  final Future<List<MealModel>> future;

  @override
  State<MealsGrid> createState() => _MealsGridState();
}

class _MealsGridState extends State<MealsGrid> {
  @override
  Widget build(BuildContext context) {
    double borderRadius = 14;
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.waiting) {
          return MealsGridShimmer();
        } else if (snapShot.hasError) {
          return Center(
            child: Text(
              'There is No Meals ! ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
            ),
          );
        } else if (snapShot.hasData) {
          List<MealModel> meals = snapShot.data!;
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 24,
              childAspectRatio: 0.86,
            ),
            itemCount: meals.length,
            itemBuilder: (context, index) {
              MealModel meal = meals[index];
              // return GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) => MealDetailsPage(meal: meal),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(bottom: 2),
              //     padding: EdgeInsets.only(bottom: 8),

              //     decoration: BoxDecoration(

              //       borderRadius: BorderRadius.circular(borderRadius),

              //       color: Color(0xFFE5E5E5),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black.withAlpha(60),
              //           offset: Offset(0, 2),
              //           blurRadius: 4,
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       children: [
              //         Expanded(
              //           child: Stack(
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.only(
              //                   topLeft: Radius.circular(borderRadius),
              //                   topRight: Radius.circular(borderRadius),
              //                 ),
              //                 child: Image.network(
              //                   // height: 200,
              //                   meal.image,
              //                   fit: BoxFit.cover,
              //                   width: double.infinity,
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 8,
              //                 right: 8,
              //                 // left: 0,
              //                 child: GestureDetector(
              //                   onTap: () {
              //                     FavouritesServices().addFavourite(meal);
              //                     BlocProvider.of<FavCubit>(
              //                       context,
              //                     ).fetchAllFav();
              //                     setState(() {});
              //                   },
              //                   child: FavouritesServices().isFavourite(meal.id)
              //                       ? SvgPicture.asset(
              //                           'assets/icons/Heart.svg',
              //                           height: 27,
              //                         )
              //                       : SvgPicture.asset(
              //                           'assets/icons/Heart(1).svg',
              //                           height: 22,
              //                           colorFilter: ColorFilter.mode(
              //                             Colors.white,
              //                             BlendMode.srcIn,
              //                           ),
              //                         ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox(height: 12),
              //         Container(
              //           margin: EdgeInsets.symmetric(horizontal: 28),
              //           height: 1.5,
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //             // color: Colors.black54,
              //             color: Colors.black.withAlpha(50),
              //             borderRadius: BorderRadius.circular(12),
              //           ),
              //         ),
              //         SizedBox(height: 12),
              //         Text(
              //           meal.name.length > 15
              //               ? '${meal.name.substring(0, 15)}...'
              //               : meal.name,
              //           style: TextStyle(fontWeight: FontWeight.bold),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MealDetailsPage(meal: meal),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Stack(
                      children: [
                        ///  Image
                        Positioned.fill(
                          child: Image.network(meal.image, fit: BoxFit.cover),
                        ),

                        ///  Gradient Overlay
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.9),
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),

                        ///  Favourite Button
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              FavouritesServices().addFavourite(meal);
                              BlocProvider.of<FavCubit>(context).fetchAllFav();
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              child: FavouritesServices().isFavourite(meal.id)
                                  ? SvgPicture.asset(
                                      'assets/icons/Heart.svg',
                                      height: 27,
                                    )
                                  : SvgPicture.asset(
                                      'assets/icons/Heart(1).svg',
                                      height: 21,
                                      colorFilter: ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                            ),
                          ),
                        ),

                        /// 📝 Meal Name
                        Positioned(
                          bottom: 12,
                          left: 12,
                          right: 12,
                          child: Text(
                            meal.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return MealsGridShimmer();
        }
      },
    );
  }
}
