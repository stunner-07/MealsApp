import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/models/meals.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meals> favouriteList;
  FavouritesScreen(this.favouriteList);
  @override
  Widget build(BuildContext context) {
    if (favouriteList.isEmpty) {
      return Center(
        child: Text(
          'No favourites Yet!!!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return ListView.builder(
          itemCount: favouriteList.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              title: favouriteList[index].title,
              imageUrl: favouriteList[index].imageUrl,
              duration: favouriteList[index].duration,
              affordability: favouriteList[index].affordability,
              complexity: favouriteList[index].complexity,
              id: favouriteList[index].id,
            );
          });
    }
  }
}
