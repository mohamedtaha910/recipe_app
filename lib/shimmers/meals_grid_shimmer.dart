import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class MealsGridShimmer extends StatelessWidget {
  const MealsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(

      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          childAspectRatio: 0.9,
        ),
        itemCount: 8,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
