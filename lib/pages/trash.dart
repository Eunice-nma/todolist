import 'package:flutter/material.dart';
import 'package:what_to_do/views/app_bar.dart';

class Trash extends StatefulWidget {
  @override
  _TrashState createState() => _TrashState();
}

class _TrashState extends State<Trash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TLAppBar(
        headerColor: Colors.black,
        headerText: "Trash",
      )
    );
  }
}
