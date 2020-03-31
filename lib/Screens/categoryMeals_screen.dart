import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/models/meals.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meals> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meals> displayCategoryMeals;
  var _isInitialised=false;
  @override
  void didChangeDependencies() {
    if(!_isInitialised){
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];
    final  categoryId = routeArgs['id'];
    displayCategoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _isInitialised=true;
    }
    super.didChangeDependencies();
  }
  void removeMeal (String mealId){
    setState(() {
      displayCategoryMeals.removeWhere((meal)=>meal.id==mealId);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
          itemCount: displayCategoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayCategoryMeals[index].title,
              imageUrl: displayCategoryMeals[index].imageUrl,
              duration: displayCategoryMeals[index].duration,
              affordability: displayCategoryMeals[index].affordability,
              complexity: displayCategoryMeals[index].complexity,
              id: displayCategoryMeals[index].id,
            );
          }),
    );
  }
}
