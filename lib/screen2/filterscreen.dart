import 'package:flutter/material.dart';

class filterscreen extends StatefulWidget {
  final Function savefilters;
  final Map<String,bool> current;
  filterscreen(this.current,this.savefilters);

  @override
  _filterscreenState createState() => _filterscreenState();
}

class _filterscreenState extends State<filterscreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.current["gluten"];
    _lactoseFree = widget.current["lactose"];
    _vegan = widget.current["vegan"];
    _vegetarian = widget.current["vegetarian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("el_title"),
        actions: [
          IconButton(
              icon: Icon(Icons.save), onPressed: () {
          Map<String,bool> _filters={
          "gluten" :_glutenFree,
          "lactose"  :_lactoseFree,
          "vegan"  :_vegan,
          "vegetarian" :_vegetarian,
          };
                widget.savefilters(_filters);
              })
        ],
      ),
      body: ListView(
        children: [
          SwitchListTile(
              value: _glutenFree,
              title: new Text("Gluten-free"),
              subtitle: new Text("Only include Gluten-free meals"),
              onChanged: (a) {
                setState(() {
                  _glutenFree = a;
                });
              }),
          SwitchListTile(
              value: _lactoseFree,
              title: new Text("Lactose-free"),
              subtitle: new Text("Only include lactose-free meals"),
              onChanged: (a) {
                setState(() {
                  _lactoseFree = a;
                });
              }),
          SwitchListTile(
              value: _vegan,
              title: new Text("vegan"),
              subtitle: new Text("Only include vegan meals"),
              onChanged: (a) {
                setState(() {
                  _vegan = a;
                });
              }),
          SwitchListTile(
              value: _vegetarian,
              title: new Text("Vegetarian"),
              subtitle: new Text("Only include vegetarian meals"),
              onChanged: (a) {
                setState(() {
                  _vegetarian = a;
                });
              }),
        ],
      ),
    );
    ;
  }
}
