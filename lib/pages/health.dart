import 'package:flutter/material.dart';

class HealthFolder extends StatefulWidget {
  @override
  _HealthFolderState createState() => _HealthFolderState();
}

class _HealthFolderState extends State<HealthFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health'),
        centerTitle: true,
      ),
    );
  }
}
