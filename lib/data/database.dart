import 'package:hive/hive.dart';

class TodoDatabase {
  //initialising the data
  List todoList = [];

  //reference the box
  final _mybox = Hive.box('mybox');

  //run when the user open the app first time
  void createInitialData() {
    todoList = [
      ['Tutorial', false],
      ['Playing', false],
    ];
  }

  //loading data
  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  //update the data
  void updateDatabase() {
    _mybox.put('TODOLIST', todoList);
  }
}
