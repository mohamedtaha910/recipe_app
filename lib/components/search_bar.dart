import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:recipe_app/constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        // color: Colors.grey.withAlpha(100),
        // color: kLightColor.withAlpha(80),
        color: Colors.grey.shade300,
      ),

      child: Row(
        children: [
          SizedBox(width: 8),
          SvgPicture.asset(
            'assets/icons/Search.svg',
            colorFilter: ColorFilter.mode(
              Colors.black.withAlpha(115),
              BlendMode.srcIn,
            ),
          ),
          // Icon(Icons.search,color: Colors.black.withAlpha(100)),
          SizedBox(width: 12),
          Text(
            'Search ',
            style: TextStyle(
              color: Colors.black.withAlpha(115),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
