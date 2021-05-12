import 'package:flutter/material.dart';

class TLInputField extends StatelessWidget {
  final TextEditingController todoEntryController;
  final addTodo;
  final addTodos;

  const TLInputField({this.addTodo, this.todoEntryController, this.addTodos});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: addTodo,
              ),
          filled: true,
          fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        ),
        onSubmitted: addTodos
      ),
    );
  }
}
