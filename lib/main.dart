import 'package:movieapp/Pages/Action.dart';

import 'package:flutter/material.dart';

import 'package:movieapp/Pages/home.dart';
import 'package:movieapp/Pages/loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/action': (context) => ActionPage(),
        // '/drawer': (context) => NavigationDrawer(),
        // '/desc': (context) => Description(
        //     name: '',
        //     description: '',
        //     bannerurl: '',
        //     posterurl: '',
        //     vote: '',
        //     launch_on: '')
      },
    ));
