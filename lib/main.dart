import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/todo_list.dart';
import 'package:flutter_app/addTodoForm.dart';
import 'package:flutter_app/customDialog.dart';
import 'package:flutter_app/simpleAnimatedList.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF344955),
    accentColor: const Color(0xFF344955),
    backgroundColor: Colors.black
  ),
  
  ));

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

Brightness brightness;

class _HomeState extends State<Home> {

  GlobalKey<TodoListState> _todoListState = GlobalKey<TodoListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: const Color(0xFF232F34),
          child: Text(
            'ToDo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              )
            )
          ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF121212),
        child: TodoList(key: _todoListState),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewDialog(
            context: context,
            builder: (BuildContext context) {
              return CustomDialog(
                backgroundColor: const Color(0xFFF4F4F4),
                insetPadding: EdgeInsets.all(10),
                title: Center(
                child: Text('New Todo',
                    style: TextStyle(
                    color: Colors.blueGrey[900],
                ))
                ),
                content: Stack(
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Container(
                      child: AddTodoForm(addTodo: _todoListState.currentState.addTodo,),
                    ),
                    
                  ],
                )
              );
            },
          );
        },
        tooltip: 'add todo',
        child: Icon(Icons.add)
      ),
    );
  }
}
