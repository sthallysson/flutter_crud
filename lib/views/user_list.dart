import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/data/dummy_users.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => UserTile(user: users.values.elementAt(i)),
        ));
  }
}
