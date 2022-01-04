import 'package:flutter/material.dart';
import '../screens/filtrers_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      int id, String title, IconData icon, Function tabHandler) {
    return ListTile(
      key: Key('listTileDrawerKey$id'),
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontFamily: 'RoboCondesed',
            fontWeight: FontWeight.bold),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: Key('drawerKey'),
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(0, 'Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(
                '/'); //deleted previous page! no back button!
            //Navigator.of(context).pushNamed('/');
          }),
          buildListTile(1, 'Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen
                .routeName); //deleted previous page! no back button!
            //Navigator.of(context).pushNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
