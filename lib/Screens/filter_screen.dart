import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function filterData;
  final Map<String, Object> currentFilters;
  FilterScreen(this.currentFilters, this.filterData);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

Widget buildSwitch(
  String title,
  bool currentValue,
  Function updateValue,
) {
  return SwitchListTile(
    value: currentValue,
    onChanged: updateValue,
    title: Text(title),
  );
}

void setState(Null Function() param0) {}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  @override
  void initState() {
    isGlutenFree = widget.currentFilters['gluten'];
    isLactoseFree = widget.currentFilters['lactose'];
    isVegetarian = widget.currentFilters['vegetarian'];
    isVegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegetarian': isVegetarian,
                  'vegan': isVegan,
                };
                widget.filterData(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                buildSwitch('isGlutanFree', isGlutenFree, (newValue) {
                  setState(() {
                    isGlutenFree = newValue;
                  });
                }),
                buildSwitch('isLactoseFree', isLactoseFree, (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                }),
                buildSwitch('vegiterian', isVegetarian, (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                }),
                buildSwitch('vegan', isVegan, (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
