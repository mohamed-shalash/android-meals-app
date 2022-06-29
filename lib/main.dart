import 'package:flutter/material.dart';
import 'package:meals_pro/dummy_data.dart';
import 'package:meals_pro/models/meal.dart';
import 'package:meals_pro/screen2/filterscreen.dart';
import 'package:meals_pro/screen2/tabscreen.dart';
import 'package:meals_pro/sreens/mainscreen.dart';
import 'package:meals_pro/screen2/category_meal.dart';
import 'package:meals_pro/screen2/meal_category_made.dart';
void main() {
  runApp(new MaterialApp(
    home: myapp(),
  )
  );
}


class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {

  Map<String,bool> _filters={
    "gluten" :false,
    "lactose"  :false,
    "vegan"  :false,
    "vegetarian" :false,
  };
  List<Meal> avilablemeal =DUMMY_MEALS;
  List<Meal> favoritemeal =[];
  void setfilters(Map<String,bool> filtersdata){
    _filters =filtersdata;
    avilablemeal =DUMMY_MEALS.where((element) {
      if(_filters["gluten"] && element.isGlutenFree==false)
        return false;
      if(_filters["lactose"] && element.isLactoseFree==false)
        return false;
      if(_filters["vegan"] && element.isVegan==false)
        return false;
      if(_filters["vegetarian"] && element.isVegetarian==false)
        return false;
      return true;
    }).toList();
  }

  void _togglefavorit(String mealid){
    final existingIndex=favoritemeal.indexWhere((meal) => meal.id ==mealid);
    if(existingIndex >=0){
      setState((){
        favoritemeal.removeAt(existingIndex);
      });
    }else{
      setState((){
        favoritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id ==mealid));
      });
    }
  }

  bool ismealfavorit(String mealid){

    return favoritemeal.any((meal) => meal.id ==mealid);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: mainapp(),
      routes: {
        '/':(context)=>tabscreen(favoritemeal),
        '/category_meal':(context)=>category_meal(avilablemeal),
        '/how_made':(context)=>mealcategormadey(_togglefavorit,ismealfavorit),
        '/fuilterscreen':(context)=>filterscreen(_filters,setfilters),
      },
    );
  }
}



class mainapp extends StatefulWidget {
  @override
  _mainappState createState() => _mainappState();
}

class _mainappState extends State<mainapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new Center(
         child: mainscreen(),
      ),
    );
  }
}

