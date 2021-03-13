import 'package:flutter/material.dart';
/*
class SharedVariables extends StatefulWidget {
  @override
  _SharedVariablesState createState() => _SharedVariablesState();
}

class _SharedVariablesState extends State<SharedVariables> {

  bool allTask= true;
  bool completedTask= false;
  bool nonCompletedTask= false;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
*/

  bool allTask= true;
  bool completedTask= false;
  bool nonCompletedTask= false;

  /*
AppBar myAppBar(context, headerColor, headerText, todoList){
  return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 100, // Set this height
      flexibleSpace: Container(
        color: Color(headerColor),
      ),
      title: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context, todoList),
              ),
              IconButton(
                onPressed:(){
                  showDialog(
                    context: context,
                      builder: (_) => new AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0))),
                        elevation: 0,
                        actions: <Widget>[
                          FlatButton(child: Center(
                            child: Text(
                                'Show All Task',
                                 style: allTask? TextStyle(
                                     fontSize: 24.0,
                                     color: Colors.grey[800],
                                     fontWeight: FontWeight.w500
                                 ):TextStyle(
                                     fontSize: 20.0,
                                     color: Colors.grey[500],
                                     fontWeight: FontWeight.w500
                                 ),
                            ),
                          ),
                            onPressed: (){
                              allTask= true;
                              completedTask= false;
                              nonCompletedTask= false;
                              Navigator.of(context).pop();
                            }
                          ),
                          FlatButton(
                            onPressed: (){
                              allTask= false;
                              completedTask= true;
                              nonCompletedTask= false;
                              Navigator.of(context).pop();
                            },

                             child: Center(
                               child: Text(
                                  'Show Completed Task',
                                  style: completedTask? TextStyle(fontSize: 24.0, color: Colors.grey[800], fontWeight: FontWeight.w500):
                                  TextStyle(fontSize: 20.0, color: Colors.grey[500], fontWeight: FontWeight.w500)
                                ),
                              ),
                          ),
                          FlatButton(child: Center(
                            child: Text(
                                'Show Uncompleted Task',
                                style: nonCompletedTask? TextStyle(fontSize: 24.0, color: Colors.grey[800], fontWeight: FontWeight.w500):
                                TextStyle(fontSize: 20.0, color: Colors.grey[500], fontWeight: FontWeight.w500)
                            ),
                          ),
                              onPressed: (){
                                allTask= false;
                                completedTask= false;
                                nonCompletedTask= true;
                                Navigator.of(context).pop();
                              }
                          )
                        ],
                      ));
                },
                icon: Icon(Icons.menu, color: Colors.white)
              ),
            ],
          ),
          Align(
              alignment: Alignment.center,
              child: Text(headerText)
          )
        ],
      )
  );
}
*/


