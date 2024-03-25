import 'package:demoapp/util/habit_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyHabitTile extends StatelessWidget {
  final String text;
  final bool isCompleted;

  const MyHabitTile({super.key, required this.text, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: isCompleted
              ? Colors.green
              : Theme.of(context).colorScheme.secondary,
        ),
        child: Text(text));
  }
}
