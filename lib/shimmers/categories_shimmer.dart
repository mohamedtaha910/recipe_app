import 'package:flutter/material.dart';
// import 'package:recipe_app/constant.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                
                return Shimmer(
                  child: Container(
                    height: 40,
                    width: 70,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      // color: kLightColor.withAlpha(100),
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(25),
                    
                    ),
                  
                  ),
                );
              },
            ),
          );
  }
}