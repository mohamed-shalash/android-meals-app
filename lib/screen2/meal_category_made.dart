import 'package:flutter/material.dart';
import 'package:meals_pro/models/meal.dart';

class mealcategormadey extends StatefulWidget {
  final Function togglefavorit;
  final Function isfavorit;
  mealcategormadey(this.togglefavorit,this.isfavorit);
  @override
  _mealcategormadeyState createState() => _mealcategormadeyState();
}

class _mealcategormadeyState extends State<mealcategormadey> {
  Widget add_word(String text){
    return Container(
      alignment: Alignment.center,
      child: new Text(text),
    );
  }
//--------------------------------------------

  Widget add_list(Widget widget){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: widget,
    );
  }

//-----------------------------------------------
  @override
  Widget build(BuildContext context) {
    final m = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    Meal mm = m['meals'];
    return Scaffold(
      appBar: AppBar(
        title: new Text(mm.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(mm.imageUrl),
            ),
            add_word("ingradints"),
            add_list(ListView.builder(
              itemBuilder: (ctx, index) => new Text(
                mm.ingredients[index],
                style: TextStyle(
                  backgroundColor: Colors.amber,
                ),
              ),
              itemCount: mm.ingredients.length,
            ),),
            add_word("steps"),
            add_list(ListView.builder(
              itemBuilder: (ctx, index) =>
              Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("#${index+1}"),
                    ),
                    title:new Text(mm.steps[index],                    ),
                  ),

                  Divider(),
                ]
              ),

              itemCount: mm.steps.length,
            ),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          widget.isfavorit(mm.id)? Icons.star :Icons.star_border
        ),
        onPressed: ()=>widget.togglefavorit(mm.id),
      ),
    );
  }
}
