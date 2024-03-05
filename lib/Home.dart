import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statment/component/TodosTile.dart';
import 'package:statment/data/data.dart';
import 'package:statment/data/todoModel.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> FoundTodo = [];
  call() async {
    final proz = Provider.of<data>(context, listen: false);
    await proz.getTasks();
    FoundTodo = proz.Lists;
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  void search(String searchText) {
    var proz = Provider.of<data>(context, listen: false);
    List<Task> results = [];
    if (searchText.isEmpty) {
      results = proz.Lists;
    } else {
      results = proz.Lists.where((element) =>
              element.todo.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }

    setState(() {
      FoundTodo = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Task')),
      ),
      body: Consumer<data>(
          builder: (BuildContext context, data value, Widget? child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SearchBar(
                onChanged: (keyword) {
                  search(keyword);
                },
              ),
              FutureBuilder(
                  future: value.getTasks(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: FoundTodo.length,
                        itemBuilder: (context, index) {
                          return TodosTile(
                            todo: FoundTodo[index].todo,
                            id: FoundTodo[index].userid,
                            userID: FoundTodo[index].id,
                            Completed: FoundTodo[index].compelete,
                          );
                        });
                  })
            ],
          ),
        );
      }),
    );
  }
}
