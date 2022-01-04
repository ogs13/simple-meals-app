import 'package:flutter/material.dart';

import 'package:meals_app/dummy.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function _isFavorite;
  MealDetailScreen(this.toggleFavorite, this._isFavorite);

  Widget buildSectionTitle(BuildContext context, Key key, String text) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainer(Key key, Widget child) {
    return Container(
        key: key,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((item) => item.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        key: Key('meadDetailsKey'),
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
            buildSectionTitle(context, Key('meatTitleKey'), 'Ingridients'),
            buildContainer(
              Key('mealIngredientsKey'),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, Key('mealTitleStepsKey'), 'Steps'),
            buildContainer(
                Key('mealStepsKey'),
                ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                          subtitle: Text(''),
                        ),
                        Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //child: Icon(Icons.delete),
        //onPressed: () {
        //Navigator.of(context).pop(mealId);
        //},
        key: Key('mealFABKey'),
        child: Icon(_isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          return toggleFavorite(mealId);
        },
      ),
    );
  }
}
