import 'package:flutter/material.dart';

class EventsFolder extends StatefulWidget {
  @override
  _EventsFolderState createState() => _EventsFolderState();
}

class _EventsFolderState extends State<EventsFolder> {
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
