import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // for first time user
    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //hive box reference
  final _mybox = Hive.box('mybox');
  //text controller
  final _controller = TextEditingController();
  //list for the tasks
  TodoDatabase db = TodoDatabase();
  //method change checkbox
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
    });
    db.updateDatabase();
  }

  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        saveButton: saveNewTask,
        cancelButton: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  //save the text to task
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDatabase();
    Navigator.of(context).pop();
  }

  //delete task function
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('TO DO'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            title: db.todoList[index][0],
            istaskCompleted: db.todoList[index][1],
            onchanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => createNewTask(),
      ),
    );
  }
}
