import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customCheckbox.dart';

class TodoListItem extends StatelessWidget {
  final bool isSelected;
  final String itemTitle;
  final Function onPressed;
  final Color selectedColor;

  const TodoListItem({Key key, this.isSelected, this.itemTitle, this.onPressed, this.selectedColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 15.0),
        child: Container(
          child: Row(
            children: [
              CustomCheckBox(
                selectedColor: selectedColor,
                isSelected: isSelected,
              ),
              SizedBox(width: 20,),
              Expanded(
                  child: Text(
                    itemTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}