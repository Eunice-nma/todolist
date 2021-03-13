import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/myAppBar.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';
import 'package:what_to_do/views/customCheckbox.dart';

class WorkFolderNew extends StatefulWidget {
  @override
  _WorkFolderNewState createState() => _WorkFolderNewState();
}

class _WorkFolderNewState extends State<WorkFolderNew> {
  final todoEntryController = TextEditingController(text: '');

  final todos = [];
  final selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TLAppBar(
        headerColor: TLColors.blue,
        headerText: 'Work',
        actions: [
          InkWell(
            onTap: () {},
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
                child: ListView.separated(
                    itemBuilder: (_context, _index) {
                      var item = todos[_index];
                      return TodoListItem(
                        isSelected: selectedItems.contains(item),
                        itemTitle: item,
                        onPressed: () {
                          setState(() {
                            if(selectedItems.contains(item))
                              selectedItems.remove(item);
                            else
                            selectedItems.add(item);
                          });
                        },
                      );
                    },
                    separatorBuilder: (_context, _index) => SizedBox(height: 15,),
                    itemCount: todos.length),
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
      todoEntryController.text = "";
    });

    FocusScope.of(context).unfocus();
  }
}

class TodoListItem extends StatelessWidget {
  final bool isSelected;
  final String itemTitle;
  final Function onPressed;

  const TodoListItem({Key key, this.isSelected, this.itemTitle, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            CustomCheckBox(
              selectedColor: TLColors.blue,
              isSelected: isSelected,
            ),
            SizedBox(width: 20,),
            Expanded(
                child: Text(
                  itemTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                ))
          ],
        ),
      ),
    );
  }
}
