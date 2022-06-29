import 'package:flutter/material.dart';
import 'package:meals_pro/models/meal.dart';

class favoritescreen extends StatelessWidget {

  final List<Meal> favoritemeal;

  const favoritescreen(this.favoritemeal);

  String  complexitytext(String comp){
    switch(comp){
      case "Challenging" :return "Challenging";
      case "Hard" :return "Hard";
      case "Simple" :return "Simple";
      default :return "un known";
    }
  }
 String affordabilitytext(String afford){
    switch(afford){
      case "Affordable" :return "Affordable";
      case "Pricey" :return "Pricey";
      case "Luxurious" :return "Luxurious";
      default :return "un known";
    }
  }

  @override
  Widget build(BuildContext context) {

    if(favoritemeal.isEmpty){
      return  Center(
        child: new Text("favorit"),
      );
    }
    else{
      return ListView.builder(itemBuilder: (ctx,index){
        return Card(
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
                    child: Image.network(favoritemeal[index].imageUrl),
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
                        child: Text(favoritemeal[index].title,style: TextStyle(color: Colors.white),),
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
                      new Text("${favoritemeal[index].duration} min"),
                    ],
                  ),
                  Row(
                    children: [
                      new Icon(Icons.work),
                      SizedBox(width: 6,),
                      new Text("${complexitytext(favoritemeal[index].complexity.toString())} "),
                    ],
                  ),
                  Row(
                    children: [
                      new Icon(Icons.attach_money),
                      SizedBox(width: 6,),
                      new Text("${affordabilitytext(favoritemeal[index].affordability.toString())} "),
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },itemCount: favoritemeal.length,);
    }
  }
}
