import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/pages/allTask.dart';
//import 'package:what_to_do/myAppBar.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:what_to_do/views/customCheckbox.dart';
import 'package:what_to_do/views/todo_list_item.dart';

class WorkFolderNew extends StatefulWidget {
  @override
  _WorkFolderNewState createState() => _WorkFolderNewState();
}


bool allTask= true;
bool completedTask= false;
bool nonCompletedTask= false;


class _WorkFolderNewState extends State<WorkFolderNew> {
  final todoEntryController = TextEditingController(text: '');

  final todos = [];
  final selectedItems = [];
  final unselectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TLAppBar(
        headerColor: TLColors.blue,
        headerText: 'Work',
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 0,
                    actions: <Widget>[
                      TextButton(child: Center(
                        child: Text(
                          'Show All Task',
                          style: allTask? TextStyle(
                              fontSize: 26.0,
                              color: Colors.grey[900],
                              fontWeight: FontWeight.w500
                          ):TextStyle(
                              fontSize: 20.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                          onPressed: (){
                            setState(() {
                              allTask= true;
                              completedTask= false;
                              nonCompletedTask= false;
                              Navigator.of(context).pop();
                            });
                          }
                      ),
                      TextButton(
                        onPressed: (){
                          setState(() {
                            allTask= false;
                            completedTask= true;
                            nonCompletedTask= false;
                            Navigator.of(context).pop();
                          });
                        },

                        child: Center(
                          child: Text(
                              'Show Completed Task',
                              style: completedTask? TextStyle(
                                  fontSize: 26.0,
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.w500
                              ):
                              TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w500
                              )
                          ),
                        ),
                      ),
                      TextButton(child: Center(
                        child: Text(
                            'Show Uncompleted Task',
                            style: nonCompletedTask? TextStyle(
                                fontSize: 26.0,
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w500
                            ):
                            TextStyle(
                                fontSize: 20.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500
                            )
                        ),
                      ),
                          onPressed: (){
                            setState(() {
                              allTask= false;
                              completedTask= false;
                              nonCompletedTask= true;
                              Navigator.of(context).pop();
                            });
                          }
                      )
                    ],
                  ));
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: todos.length==0?
                Center(child: Text('add items')):
                    // nonCompletedTask? unselectedItems.length==0?
                    // Center(child: Text('no unchecked item')):completedTask? selectedItems.length==0?
                    // Center(child: Text('no checked item')):
                ListView.separated(
                    itemBuilder: (_context, _index) {
                      var item = allTask? todos[_index]:
                      nonCompletedTask?unselectedItems[_index]:
                      selectedItems[_index];
                      return Container(
                        child: Slidable(
                          dismissal: SlidableDismissal(
                            child: SlidableDrawerDismissal(),
                            onDismissed: (actionType) {
                              setState(() {
                                todos.removeAt(_index);
                              });
                            },
                          ),
                          key: ValueKey(todos[_index]),
                          actionPane: SlidableScrollActionPane(),
                          actionExtentRatio: 0.25,
                            child: TodoListItem(
                            isSelected: selectedItems.contains(item),
                        itemTitle: item,
                        onPressed: () {
                          setState(() {
                            if (selectedItems.contains(item))
                              selectedItems.remove(item);
                            else
                              selectedItems.add(item);
                          });
                        },
                      ),
                          actions: <Widget>[
                            IconSlideAction(
                              icon: Icons.close,
                              caption: 'Delete',
                              color: Theme.of(context).accentColor,
                              onTap: () {
                                setState(() {
                                  todos.removeAt(_index);
                                });
                              },
                            )
                          ],
                        ),
                      );

                    },
                    separatorBuilder: (_context, _index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: todos.length
                ),
              ),
            ),
            Container(
              height: 50.0,
              child: TextField(
                controller: todoEntryController,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(22.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(22.0))),
                  suffixIcon: IconButton(
                      icon:
                          Icon(Icons.add, size: 30.0, color: Colors.grey[700]),
                      onPressed: () {
                        addTodo();
                      }),
                  filled: true,
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                ),
                onSubmitted: (newValue) {
                  addTodo();
                },
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  void addTodo() {
    var input = todoEntryController.value.text;
    if (input.isEmpty) return;

    setState(() {
      todos.add(input);
      unselectedItems.add(input);
      allTask= true;
      nonCompletedTask= false;
      completedTask= false;
      todoEntryController.text = "";
    });

    FocusScope.of(context).unfocus();
  }

  // void check() {
  //   // nonCompletedTask=!nonCompletedTask;
  //   // completedTask=!completedTask;
  //   if(nonCompletedTask= true){
  //
  //   }
  // }
}
