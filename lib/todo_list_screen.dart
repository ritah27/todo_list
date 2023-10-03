// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
  
}

class _TodoListScreenState extends State<TodoListScreen> {
  
  List<Todo> todos = []; // List to store todo items
  

  
  
  final TextEditingController _textEditingController =
      TextEditingController(); // Controller for the task input field
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-do List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
           title: Text(todo.title),
            leading: Checkbox(
             value: todo.completed,
     onChanged: (value){
      setState(() {
      if(!todo.completed){
        todo.completed = false;
      }
      else{
        todo.completed = true;
      }
    });
  },
      key: Key(todo.title),
      title: _strikeThrough(todoText:todo.title, todoToggle: todo.completed),
        ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  todos.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Add Task'),
                content: TextField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(hintText: 'Enter task…'),
                ),
                actions: [
                  ElevatedButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Add'),
                    onPressed: () {
                      setState(() {
                        todos.add(Todo(
                          title: _textEditingController.text,
                          completed: false,
                        ));
                        _textEditingController.clear();
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
  
  
}

// ignore: unused_element
class _strikeThrough {
   bool todoToggle;
  String todoText;
  _strikeThrough({required this.todoToggle, required this.todoText}) : super();

 
}

class Todo {
  String title;
  bool completed;
  Todo({required this.title, required this.completed});
}
