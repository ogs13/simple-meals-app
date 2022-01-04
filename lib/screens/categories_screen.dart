import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      key: Key('categoryGridViewKey'),
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: <Widget>[
        ...DUMMY_CATEGORIES.map((c) {
          return CateroryItem(
            id: c.id,
            title: c.title,
            color: c.color,
          );
        }).toList(),
      ],
    );
  }
}
