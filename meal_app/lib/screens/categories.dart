import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // GridView.builder -- if you dont know the amount of content and need to manage performance
    return GridView(
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color))
          .toList(),
      // slivers are scroll area in the screen
      // GridDelegate means for the grid this takes care about structuring layouting the grid
      // MaxCrossAxisExtent means pre configured allows us define a max width for each grid item and then automatically helps to fit as many items that can be held in that width defined
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // depends on device
        childAspectRatio: 3 / 2, // 1.5
        // space btw rows and columns
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
