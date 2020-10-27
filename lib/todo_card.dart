import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {

  final todo;
  final Function delete;

  const TodoCard(this.todo, this.delete);

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(12.0),
            color: const Color(0xFF4A6572),
            margin: EdgeInsets.fromLTRB(1.0, 2.0, 1.0, 0.0),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(2.0, 14.0, 2.0, 0.0),
                      child:
                      Text(
                        todo.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          decoration: todo.done? TextDecoration.lineThrough : TextDecoration.none
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => delete(todo),
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                    )
                  ]
                ),
                Text(
                  todo.description, 
                  style: TextStyle(
                    color: Colors.white60)
                  )
              ]
            )
          );
  }
}