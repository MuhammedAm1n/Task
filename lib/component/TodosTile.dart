import 'package:flutter/material.dart';

class TodosTile extends StatelessWidget {
  final String todo;
  final int id;
  final int userID;
  final bool Completed;
  TodosTile({
    super.key,
    required this.todo,
    required this.id,
    required this.userID,
    required this.Completed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListTile(
          leading: Text(
            '$id',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Color.fromARGB(255, 18, 67, 107),
          title: Text(
            todo,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text('Completed : $Completed',
              style: TextStyle(color: Colors.white)),
          trailing: Text(
            '$userID',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}
