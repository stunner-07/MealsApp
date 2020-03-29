import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/category_item.dart';

import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(25),
        children: <Widget>[
          ...DUMMY_CATEGORIES.map((catData) {
            return CategoryItem(
              id: catData.id,
              color: catData.color,
              title: catData.title,
            );
          }).toList(),
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
