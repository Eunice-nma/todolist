import 'package:flutter/material.dart';
//import 'package:what_to_do/customCheckbox.dart';
import 'package:what_to_do/myAppBar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';

List todos = []; //['List'];

class WorkFolder extends StatefulWidget {
  @override
  _WorkFolderState createState() => _WorkFolderState();
}

class _WorkFolderState extends State<WorkFolder> {
  List unselectedTodos = ['no'];
  List selectedTodo = ['yes'];
  String input = '';
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final fieldText = TextEditingController();
    void clearText() {
      fieldText.clear();
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 100, // Set this
          flexibleSpace: TLAppBar(
            headerColor: TLColors.blue,
            headerText: 'Work',
          ),
        ),

        // myAppBar(context, 0xFF005ef5, 'Work', {'count': todos}),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 12.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: todos.length== 0? Center(child: Text('add items')):  ListView.builder(
                    //children: List.generate(todos.length, (index) => null),
                    itemCount: allTask? todos.length: completedTask? selectedTodo.length: unselectedTodos.length,
                    itemBuilder: (BuildContext context, int i){
                        return Container(
                          child: Slidable(
                            dismissal: SlidableDismissal(
                              child: SlidableDrawerDismissal(),
                              onDismissed: (actionType) {
                                setState(() {
                                  todos.removeAt(i);
                                });
                              },
                            ),
                            key: ValueKey(todos[i]),
                            actionPane: SlidableScrollActionPane(),
                            actionExtentRatio: 0.25,
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Container(
                                    child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            _isSelected = !_isSelected;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: _isSelected? Color(0xFF005ef5) ?? Colors.blue : Colors.transparent,
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: _isSelected? null: Border.all(
                                                  color: Colors.grey,
                                                  width: 1.5
                                              )
                                          ),
                                          width: 20.0,
                                          height: 20.0,
                                          child: _isSelected ? Icon(
                                            Icons.check,
                                            color: Colors.black,
                                            size: 15.0,
                                          ) : null,
                                        )
                                    ),
                                    /*CustomCheckbox(
                                        selectedColor: Color(0xFF005ef5),
                                    ),*/
                                      ),

                                      SizedBox(
                                        width:
                                            5, // here put the desired space between the icon and the text
                                      ),
                                      Flexible(
                                          child: Text(
                                        allTask
                                            ? todos[i]
                                            : completedTask
                                                ? selectedTodo[i]
                                                : unselectedTodos[i],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      )) // here we could use a column widget if we want to add a subtitle
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  IconSlideAction(
                                    icon: Icons.close,
                                    caption: 'Delete',
                                    color: Theme.of(context).accentColor,
                                    onTap: () {
                                      setState(() {
                                        todos.removeAt(i);
                                      });
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                  child: Container(
                    height: 50.0,
                    child: TextField(
                      controller: fieldText,
                      cursorColor: Colors.grey[700],
                      onChanged: (String value) {
                        input = value;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(22.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(22.0))),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.add,
                                size: 30.0, color: Colors.grey[700]),
                            onPressed: () {
                              setState(() {
                                todos.add(input);
                                FocusScope.of(context).unfocus();
                                clearText();
                                input = '';
                              });
                            }),
                        filled: true,
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      onSubmitted: (newValue) {
                        setState(() {
                          todos.add(input);
                          unselectedTodos.add(input);
                          FocusScope.of(context).unfocus();
                          clearText();
                          input = '';
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
