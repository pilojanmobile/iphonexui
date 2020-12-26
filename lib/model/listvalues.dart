import 'package:flutter/material.dart';

class ListValues {
  int taskcount;
  String value;
  double percentage;
  MaterialColor color;
  String imagepath;

  ListValues(
      {this.taskcount,
      this.value,
      this.percentage,
      this.color,
      this.imagepath});
}

var listofvalue = [
  new ListValues(
      taskcount: 44,
      value: "Person",
      percentage: 20,
      color: Colors.orange,
      imagepath: "assets/images/person.png"),
  new ListValues(
      taskcount: 14,
      value: "Worker",
      percentage: 56,
      color: Colors.blue,
      imagepath: "assets/images/worker.png"),
  new ListValues(
      taskcount: 24,
      value: "Friend",
      percentage: 72,
      color: Colors.purple,
      imagepath: "assets/images/friend.png"),
  new ListValues(
      taskcount: 43,
      value: "Family",
      percentage: 87,
      color: Colors.teal,
      imagepath: "assets/images/family.png"),
];
