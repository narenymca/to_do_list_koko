import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback saveButton;
  VoidCallback cancelButton;
  DialogBox(
      {Key? key,
      required this.controller,
      required this.saveButton,
      required this.cancelButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                label: Text('Task'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed: saveButton,
                ),
                SizedBox(width: 20),
                MyButton(
                  text: 'Cancel',
                  onPressed: cancelButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
