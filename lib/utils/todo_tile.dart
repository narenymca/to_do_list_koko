import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String title;
  final bool istaskCompleted;
  Function(bool?)? onchanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({
    Key? key,
    required this.title,
    required this.istaskCompleted,
    required this.onchanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            icon: Icons.delete,
            label: 'Delete',
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
            onPressed: deleteFunction,
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              //checked box
              Checkbox(
                activeColor: Colors.black,
                value: istaskCompleted,
                onChanged: onchanged,
              ),
              //task name
              Text(
                title,
                style: TextStyle(
                  decoration: istaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
