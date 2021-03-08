import 'package:flutter/material.dart';

class ShoppingFolder extends StatefulWidget {
  @override
  _ShoppingFolderState createState() => _ShoppingFolderState();
}

class _ShoppingFolderState extends State<ShoppingFolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100, // Set this height
          flexibleSpace: Container(
            color: Color(0xFFf74f56),
          ),
          title: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                      icon: Icon(Icons.menu, color: Colors.white),
                      onPressed: null
                  )
                ],
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text('Shopping')
              )
            ],
          )
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  Text('hi')
                ],
              ),
            ),
            TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(30.0))
                    ),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.add, size: 30.0),
                        onPressed: null
                    ),
                    filled: true,
                    fillColor: Colors.grey[400]
                )
            )

          ],
        ),
      ),
    );
  }
}


