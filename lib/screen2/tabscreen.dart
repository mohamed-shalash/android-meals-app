import 'package:flutter/material.dart';
import 'package:meals_pro/main.dart';
import 'package:meals_pro/models/drowablefile.dart';
import 'package:meals_pro/models/meal.dart';
import 'package:meals_pro/screen2/category_meal.dart';
import 'package:meals_pro/screen2/favoritescreen.dart';

class tabscreen extends StatefulWidget {
  final List<Meal> favoritemeal;

  const tabscreen(this.favoritemeal);

  @override
  _tabscreenState createState() => _tabscreenState();
}

class _tabscreenState extends State<tabscreen> {

  List<Map<String,Object>> lis;
  int setselectpageindex =0;

  @override
  void initState(){
    lis=[
      {
        'title':'Category',
        'page':mainapp(),
      },
      {
        'title':'favorit',
        'page':favoritescreen(widget.favoritemeal),
      }
    ];
  }

  void _selectpage(int value){
    setState(() {
      setselectpageindex =value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(lis[setselectpageindex]['title']),
      ),
      body: lis[setselectpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: setselectpageindex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.category),title: new Text("Category")),
          BottomNavigationBarItem(icon: Icon(Icons.star),title: new Text("favorite")),
        ],
      ),
      drawer: drawerfile(),
    );
  }
}
