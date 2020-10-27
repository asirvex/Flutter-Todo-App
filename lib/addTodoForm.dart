import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/todo_list.dart';
import 'package:flutter_app/todo.dart';

class AddTodoForm extends StatefulWidget {

  final Function addTodo;

  const AddTodoForm({this.addTodo});

  @override
  AddTodoFormState createState() {
    return AddTodoFormState(addTodo: addTodo);
  }
}


class AddTodoFormState extends State<AddTodoForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<AddTodoFormState>.
  final _formKey = GlobalKey<FormState>();

  final Function addTodo;

  AddTodoFormState({this.addTodo});

  final titleController = TextEditingController();
  
  final descriptionController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: titleController,
            style: TextStyle(
                color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: "Todo",
              labelStyle: TextStyle(color: Colors.grey[600]),
              fillColor: Colors.grey[200],
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue[300],
                    width: 2.0
                  ),
                ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter todo';
              }
              return null;
            },
          ),
          TextFormField(
            controller: descriptionController,
            style: TextStyle(
                color: Colors.black,
            ),
            decoration: InputDecoration(
              labelText: "Description",
              labelStyle: TextStyle(color: Colors.grey[600]),
              fillColor: Colors.grey[200],
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue[300],
                    width: 2.0
                  ),
                ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter the description';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  addTodo(
                    Todo(
                      title: titleController.text,
                      description: descriptionController.text,
                      done: false
                      ));
                    Navigator.pop(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
