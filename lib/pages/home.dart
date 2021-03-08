import 'package:flutter/material.dart';

class HomeFolder extends StatefulWidget {
  @override
  _HomeFolderState createState() => _HomeFolderState();
}

class _HomeFolderState extends State<HomeFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
    );
  }
}
