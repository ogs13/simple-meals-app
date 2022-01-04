import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CateroryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CateroryItem({this.id, this.title, this.color});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
      "categoryId": id,
      "categoryTitle": title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: Key('categoryItemKey_$id'),
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.headline6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
