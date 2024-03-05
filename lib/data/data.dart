import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:statment/data/todoModel.dart';

class data extends ChangeNotifier {
  List<Task> overAllLists = [];
  List<Task> Lists = [];
  Future<List<Task>> getTasks() async {
    final response = await Dio().get('https://dummyjson.com/todos');
    Lists = List<Task>.from(
        (response.data["todos"] as List).map((e) => Task.FromJson(e)));
    return Lists;
  }
}
