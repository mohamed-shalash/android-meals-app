import 'package:flutter/material.dart';
import 'package:meals_pro/dummy_data.dart';
import 'package:meals_pro/models/meal.dart';

class mealcard extends StatelessWidget {
  Meal m;
  Function removeitem;

  String get complexitytext{
    switch(m.complexity){
      case Complexity.Challenging :return "Challenging";
      case Complexity.Hard :return "Hard";
      case Complexity.Simple :return "Simple";
      default :return "un known";
    }
  }
  String get affordabilitytext{
    switch(m.affordability){
      case Affordability.Affordable :return "Affordable";
      case Affordability.Pricey :return "Pricey";
      case Affordability.Luxurious :return "Luxurious";
      default :return "un known";
    }
  }

  mealcard(this.m,this.removeitem);

  void clicked(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/how_made',arguments: {
        'meals':m,
    }
    ).then((value) //=>      print(value)
      {if(value != null) {
        removeitem(value);
        print(value);
      }}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>clicked(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(5),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(m.imageUrl),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 220,
                      color: Colors.black54,
                      padding: EdgeInsets.all(20),
                      child: Text(m.title,style: TextStyle(color: Colors.white),),
                    )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    new Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    new Text("${m.duration} min"),
                  ],
                ),
                Row(
                  children: [
                    new Icon(Icons.work),
                    SizedBox(width: 6,),
                    new Text("${complexitytext} "),
                  ],
                ),
                Row(
                  children: [
                    new Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    new Text("${affordabilitytext} "),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
