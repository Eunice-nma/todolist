import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TLSlider extends StatelessWidget {
  final List todoArray;
  final Function removeItem;
  final Widget child;
  final ValueKey valueKey;

  TLSlider({this.removeItem, this.child, this.todoArray, this.valueKey});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      dismissal: SlidableDismissal(
        child: SlidableDrawerDismissal(),
        onDismissed: (actionType) {
          removeItem();
        },
      ),
      key: valueKey,//ValueKey(todos[_index]),
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.25,
      child: child,

      actions: <Widget>[
        IconSlideAction(
          icon: Icons.close,
          caption: 'Delete',
          color: Theme.of(context).accentColor,
          onTap: () {
            removeItem();

          },
        )
      ],
    );
  }
}
