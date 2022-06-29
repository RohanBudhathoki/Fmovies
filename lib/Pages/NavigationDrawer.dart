// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movieapp/Pages/Action.dart';

class NavigationDrawer extends StatelessWidget {
  final Padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: ListView(
          children: [
            buildmenu(
              text: 'Genre',
              icon: Icons.ac_unit,
              onPressed: () {},
            ),
            SizedBox(
              height: 20,
            ),
            buildmenu(
              text: 'Action',
              icon: Icons.tablet_mac,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ActionPage()));
              },
            ),
            buildmenu(
              text: 'Adventure',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Comedy',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Romance',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Horror',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Mystry',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Crime',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
            buildmenu(
              text: 'Country',
              icon: Icons.tablet_mac,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildmenu({
  required String text,
  required IconData icon,
  VoidCallback? onPressed,
}) {
  final color = Colors.white;
  final hovercolor = Colors.white;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hovercolor,
    onTap: onPressed,
  );
}
