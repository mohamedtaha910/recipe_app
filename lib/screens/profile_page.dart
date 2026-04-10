import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_cubits.dart';
import 'package:recipe_app/cubits/fav_cubits/fav_states.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'dart:ui';

import 'package:recipe_app/screens/favourite_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<MealModel> favourites = [];

  @override
  void initState() {
    BlocProvider.of<FavCubit>(context).fetchAllFav();
    favourites = BlocProvider.of<FavCubit>(context).favMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavStates>(
      builder: (context, state) {
        BlocProvider.of<FavCubit>(context).fetchAllFav();
        favourites = BlocProvider.of<FavCubit>(context).favMeals;

        return Scaffold(
          // backgroundColor: Colors.black54,
          body: Stack(
            children: [
              /// Background
              // Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //       colors: [
              //         Color.fromARGB(255, 64, 91, 83),
              //         Color.fromARGB(255, 64, 91, 83),
              //         Color.fromARGB(204, 39, 31, 0),
              //         Color.fromARGB(204, 39, 31, 0),
              //         Color.fromARGB(204, 39, 31, 0),
              //         Color.fromARGB(204, 39, 31, 0),
              //         Color.fromARGB(204, 35, 33, 25),
              //         Color.fromARGB(204, 35, 33, 25),
              //         Color.fromARGB(204, 35, 33, 25),
                     
                     
              //         Colors.black54,
              //         // Colors.black54,
              //         Colors.transparent
              //       ],
              //       begin: Alignment.topCenter,
              //       end: Alignment.bottomCenter,
              //     ),
              //   ),
              // ),
              // ============================================
              /// Background
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                     
                      Color.fromARGB(204, 35, 33, 25),
                      Color.fromARGB(204, 35, 33, 25),
                      Color.fromARGB(204, 35, 33, 25),
                      Color.fromARGB(204, 35, 33, 25),
                      // Color.fromARGB(204, 35, 33, 25),
                      // Color.fromARGB(204, 35, 33, 25),
                     
                     
                      Colors.black54,
                      
                      // Colors.black54,
                      Colors.transparent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),

              
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 100),

                    ///  Profile Image
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 53,
                        backgroundImage: AssetImage(
                          'assets/images/person.png',
                        ),
                      ),
                    ),

                    SizedBox(height: 16),

                    Text(
                      "Mohamed Taha",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 40),

                    
                    profileRow(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          info(
                            favourites.length.toString(),
                            "Favourites",
                          ),
                          info("120", "Viewed"),
                          info("8", "Categories"),
                        ],
                      ),
                    ),

                    SizedBox(height: 30),

                  
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const FavouritePage(isInProfile: true),
                        ),
                      ),
                      child: profileRow(
                        child: tile(Icons.favorite, "My Favourites"),
                      ),
                    ),
                    SizedBox(height: 16),
                    profileRow(
                      child: tile(Icons.dark_mode, "Dark Mode"),
                    ),
                    SizedBox(height: 16),
                    profileRow(child: tile(Icons.info, "About App")),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget profileRow({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget info(String number, String title) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(title, style: TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget tile(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white),
      ],
    );
  }
}
