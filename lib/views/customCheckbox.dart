import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final Color selectedColor;
  final bool isSelected;

  const CustomCheckBox({Key key, this.selectedColor, this.isSelected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
          border:  Border.all(
              color: isSelected ? selectedColor : Colors.grey,
              width: 1.5
          )
      ),
      width: 20.0,
      height: 20.0,
      child: isSelected ? Icon(
        Icons.check,
        color: Colors.black,
        size: 15.0,
      ) : null,
    );
  }
}

