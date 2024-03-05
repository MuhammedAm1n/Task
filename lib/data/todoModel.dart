import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int id;
  final String todo;
  final bool compelete;
  final int userid;

  Task(
      {required this.id,
      required this.todo,
      required this.compelete,
      required this.userid});

  factory Task.FromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'],
        todo: json['todo'],
        compelete: json['completed'],
        userid: json['userId']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, todo, compelete, userid];
}
