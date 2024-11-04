import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Home/ui/home_page.dart';
import 'package:grocery_app/screens/Product_page/Ui/product_detail.dart';
import 'package:grocery_app/screens/landing_page/ui/landing_page.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
