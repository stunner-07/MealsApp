import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_screen.dart';
import 'package:meals_app/Widgets/main_drawer.dart';
import 'package:meals_app/models/meals.dart';

import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meals> favouriteMeals;
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pageSelect;
  int selectedPageNo = 0;
  void selectPge(int index) {
    setState(() {
      selectedPageNo = index;
    });
  }
  @override
  void initState() {
    _pageSelect = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavouritesScreen(widget.favouriteMeals),
      'title': 'Favourites',
    }
  ];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageSelect[selectedPageNo]['title']),
      ),
      body: _pageSelect[selectedPageNo]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: selectedPageNo,
          onTap: selectPge,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favourites'),
            )
          ]),
    );
    //Widget build(BuildContext context) {
    //   return DefaultTabController(
    //     length: 2,
    //     child: Scaffold(
    //       appBar: AppBar(
    //           title: Text('Meals'),
    //           bottom: TabBar(
    //             tabs: <Widget>[
    //               Tab(
    //                 icon: Icon(Icons.category),
    //                 text: 'Categories',
    //               ),
    //               Tab(
    //                 icon: Icon(Icons.favorite),
    //                 text: 'Favorites',
    //               ),
    //             ],
    //           )),
    //           body: TabBarView(children: <Widget>[
    //             CategoriesScreen(),
    //             FavouritesScreen(),
    //           ],),
    //     ),
    //   );
    // }
  }
}
