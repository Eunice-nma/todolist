import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/utility/colors.dart';

import 'customCheckbox.dart';

class TodoListItem extends StatelessWidget {
  final bool isSelected;
  final String itemTitle;
  final Function onPressed;

  const TodoListItem({Key key, this.isSelected, this.itemTitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            CustomCheckBox(
              selectedColor: TLColors.blue,
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
    );
  }
}