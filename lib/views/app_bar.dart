import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TLAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color headerColor;
  final String headerText;
  final List<Widget> actions;

  TLAppBar({this.headerColor, this.headerText, this.actions});
  @override
  _TLAppBarState createState() => _TLAppBarState();

  @override
  Size get preferredSize => new Size(25, 50);

}


class _TLAppBarState extends State<TLAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Platform.isIOS ? Icon(Icons.arrow_back_ios) : Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),// Set this height
        backgroundColor: widget.headerColor,
        title: Text(widget.headerText, textAlign: TextAlign.center,),
        actions: widget.actions,
    );
  }
}