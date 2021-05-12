import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/utility/colors.dart';
import 'package:what_to_do/views/app_bar.dart';
import 'package:what_to_do/views/inputField.dart';
import 'package:what_to_do/views/slider.dart';
import 'package:what_to_do/views/todo_list_item.dart';

class HealthFolder extends StatefulWidget {
  @override
  _HealthFolderState createState() => _HealthFolderState();
}


class _HealthFolderState extends State<HealthFolder> {
  final todoEntryController = TextEditingController(text: '');
  final healthArray = [];
  final selectedItems = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: TLAppBar(
        headerColor: TLColors.green,
        headerText: 'Health',
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
                    var item = healthArray[_index];
                    return Container(
                        child: TLSlider(
                          removeItem: () {
                            setState(() {
                              healthArray.removeAt(_index);
                            });
                          },
                          todoArray: healthArray,
                          valueKey: ValueKey(healthArray[_index]),
                          child: TodoListItem(
                            selectedColor: TLColors.green,
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
                  itemCount: healthArray.length),
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
      healthArray.add(input);
      todoEntryController.text = "";
    });

    FocusScope.of(context).unfocus();
  }
}

