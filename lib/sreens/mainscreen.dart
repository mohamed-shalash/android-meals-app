import 'package:flutter/material.dart';
import 'package:meals_pro/dummy_data.dart';
import 'package:meals_pro/models/category.dart';
class mainscreen extends StatefulWidget {
  @override
  _mainscreenState createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((dataset) =>
          Category(
            id: dataset.id,
            title: dataset.title,
            color: dataset.color,
          ),
                 ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
     crossAxisSpacing: 20,
      mainAxisSpacing: 20,

    ));
  }
}
