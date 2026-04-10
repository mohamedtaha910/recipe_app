import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/models/meal_model.dart';
import 'package:recipe_app/screens/meal_details_page.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({super.key, required this.favMeal});
  final MealModel favMeal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MealDetailsPage(meal: favMeal),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          // color: Colors.grey.withAlpha(78),
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(14),
              child: Image.network(
                favMeal.image,
                fit: BoxFit.fill,
                // fit: BoxFit.cover,
                width: 110,
                height: 100,
              ),
            ),
            SizedBox(width: 16),

            Expanded(
              child: Text(
                favMeal.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Spacer(),

            SvgPicture.asset(
              'assets/icons/Arrow Right - Small.svg',
              height: 28,
            ),
          ],
        ),
      ),
    );
  }
}
