import 'package:flutter/material.dart';

class Category extends StatelessWidget{
  final String id;
  final String title;
  final Color color;

  const Category( {@required this.id,@required this.title,this.color=Colors.orange});

  void selectcategory(BuildContext cnt){
    Navigator.of(cnt).pushNamed('/category_meal',arguments: {
      'id':id,
      'title':title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: ()=>{selectcategory(context)},

      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
              color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }


}
