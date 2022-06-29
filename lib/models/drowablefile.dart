import 'package:flutter/material.dart';

class drawerfile extends StatelessWidget {

  Widget buildlisttile(String text,Icon icon,Function func){
    return ListTile(
      leading: icon,
      title: Text(text,style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      ),
      onTap: func,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: new Text("Cooking Up !",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),),
          ),
          SizedBox(height: 30,),
          buildlisttile("Meal", Icon(Icons.restaurant,size: 26,),()=>{Navigator.of(context).pushNamed("/")}),
          buildlisttile("Filters", Icon(Icons.settings,size: 26,),()=>{Navigator.of(context).pushNamed("/fuilterscreen")}),
        ],
      ),
    );
  }
}
