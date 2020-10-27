import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/todo.dart';
import 'package:flutter_app/todo_card.dart';

class TodoList extends StatefulWidget {
  
  TodoList({Key key}) : super(key: key);

  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {

  List<Todo> todos = [];

  delete(todo){
    setState(() {
      todos.remove(todo);
    });
  }

  addTodo(todo) {
    setState(() {
      todos.insert(0, todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: todos.map((todo) => TodoCard(todo, delete)).toList()
    );
  }

}