import 'package:flutter/material.dart';
/*
void select(listName, index){
  listName.add(index);
}

void notSelect(listName, index){
  listName.remove(index);
}
*/
class CustomCheckbox extends StatefulWidget {
  final Color selectedColor;
  final List selectedList;




  CustomCheckbox({this.selectedColor, this.selectedList});

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool _isSelected = false;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          _isSelected = !_isSelected;
        });


      },
      child: Container(
        decoration: BoxDecoration(
          color: _isSelected? widget.selectedColor ?? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border: _isSelected? null: Border.all(
            color: Colors.grey,
            width: 1.5
          )
        ),
        width: 20.0,
        height: 20.0,
        child: _isSelected ? Icon(
          Icons.check,
          color: Colors.black,
          size: 15.0,
        ) : null,
      )
    );
  }
}
