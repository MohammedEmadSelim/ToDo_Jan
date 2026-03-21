import 'dart:io';

class TodoParam {
  final String title;
  final String des;
  final String? deadline;
  final File? image;

  TodoParam({
    required this.title,
    required this.des,
    this.deadline,
    this.image});
}