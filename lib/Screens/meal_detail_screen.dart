import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/mealDetail';
  final Function toggleFav;
  final Function isFav;
  MealDetailScreen(this.toggleFav, this.isFav);
  Widget buildTitle(BuildContext ctx, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(title, style: Theme.of(ctx).textTheme.title),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meals) => meals.id == id);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle(context, 'Ingredients'),
              buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Colors.lime,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length)),
              buildTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(
           isFav(id) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFav(id),
      ),);
  }
}
