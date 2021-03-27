import 'package:flutter/material.dart';

class EventFolder extends StatefulWidget {
  @override
  _EventFolderState createState() => _EventFolderState();
}

class _EventFolderState extends State<EventFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        centerTitle: true,
      ),
    );
  }
}
