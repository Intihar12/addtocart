import 'package:addtocartflutter/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'State Management Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blueGrey[100],
        primaryColor: Colors.blue[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductScreen(),
    );
  }
}
