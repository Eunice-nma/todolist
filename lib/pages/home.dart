import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';
import 'package:what_to_do/views/inputField.dart';
import 'package:what_to_do/views/slider.dart';
import 'package:what_to_do/views/todo_list_item.dart';

class HomeFolder extends StatefulWidget {
  @override
  _HomeFolderState createState() => _HomeFolderState();
}


class _HomeFolderState extends State<HomeFolder> {
  final todoEntryController = TextEditingController(text: '');
  final homeArray = [];
  final selectedItems = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: TLAppBar(
        headerColor: TLColors.yellow,
        headerText: 'Home',
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
              child: ListView.separated(
                  itemBuilder: (_context, _index) {
                    var item = homeArray[_index];
                    return Container(
                        child: TLSlider(
                          removeItem: () {
                            setState(() {
                              homeArray.removeAt(_index);
                            });
                          },
                          todoArray: homeArray,
                          valueKey: ValueKey(homeArray[_index]),
                          child: TodoListItem(
                            selectedColor: TLColors.yellow,
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
                        ));
                  },
                  separatorBuilder: (_context, _index) => SizedBox(
                    height: 15,
                  ),
                  itemCount: homeArray.length),
            ),
            TLInputField(
              todoEntryController: todoEntryController,
              addTodo: () {
                addTodo();
              },
              addTodos: (newValue) {
                addTodo();
              },
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }

  addTodo() {
    var input = todoEntryController.value.text;
    if (input.isEmpty) return;


    setState(() {
      homeArray.add(input);
      todoEntryController.text = "";
    });

    FocusScope.of(context).unfocus();
  }
}

