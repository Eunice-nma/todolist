import 'package:flutter/material.dart';
// import 'package:what_to_do/myAppBar.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  List todo = [];

  @override
  void initState() {
    todo.add('hey');
    todo.add('yo');
    todo.add('hello');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TLAppBar(
        headerColor: TLColors.purple,
        headerText: 'All Tasks',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                    itemCount: todo.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 3,
                            child: ClipPath(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 28.0, 15.0, 28.0),
                                  child: Text(
                                    todo[i],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    border: Border(
                                        left: BorderSide(
                                            color: Color(0XFFf6bc38),
                                            width: 5))),
                              ),
                              clipper: ShapeBorderClipper(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6))),
                            ),
                          ));
                    }))
          ],
        ),
      ),
    );
  }
}
