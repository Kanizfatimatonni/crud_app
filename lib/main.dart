import 'package:flutter/material.dart';

import 'Screen/ProductCreateScreen.dart';
import 'Screen/ProductGrideViewScreen.dart';
import 'Screen/PruductGrideViewScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.lightGreen,
      ),
      home:ProductGridViewScreen() ,

    );
  }
}



