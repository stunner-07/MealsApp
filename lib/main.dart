import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Tabs_screen.dart';
import 'package:meals_app/Screens/filter_screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import 'package:meals_app/dummy_data.dart';

import 'Screens/categoryMeals_screen.dart';
import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegetarian': false,
    'vegan': false,
  };
  List<Meals> availablemeals = DUMMY_MEALS;
  List<Meals> favouriteMeals = [];
  void _setFilters(Map<String, bool> filterData) {
    filters = filterData;
    setState(() {
      availablemeals.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) return false;
        if (filters['lactose'] && !meal.isLactoseFree) return false;
        if (filters['vegetarian'] && !meal.isVegetarian) return false;
        if (filters['vegan'] && !meal.isVegan) return false;
        return true;
      }).toList();
    });
  }
 

  void _toggleFavourite(String mealId) {
    final existingIndex =
        favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }
 bool isFav(String id){
    return favouriteMeals.any((meal)=>meal.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      //home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availablemeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite,isFav),
        FilterScreen.routeName: (ctx) => FilterScreen(filters, _setFilters),
      },
      onGenerateRoute: (_) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(availablemeals));
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(),
//     );
//   }
// }
