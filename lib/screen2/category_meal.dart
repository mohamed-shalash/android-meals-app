import 'package:flutter/material.dart';
import 'package:meals_pro/models/meal.dart';
import 'mealcard.dart';

class category_meal extends StatefulWidget {
  final List<Meal> avilablemeal;
  category_meal(this.avilablemeal);
  @override
  _category_mealState createState() => _category_mealState();
}



class _category_mealState extends State<category_meal> {
  List<Meal> dummy=null;
  String el_id,el_title;


  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context).settings.arguments as Map<String,String>;
    el_id =args['id'];el_title =args['title'];
    dummy =widget.avilablemeal.where((element) { return element.categories.contains(el_id);}).toList();
    super.didChangeDependencies();
  }
  void removing(String mealid){
    setState(() {
     dummy.removeWhere((element) => element.id == mealid);
    });
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: new Text(el_title),),
      body: ListView.builder(
        itemBuilder: (ctx,index){
          return mealcard(dummy[index],removing);
    },
        itemCount: dummy.length,
      ),

    );
  }
}
