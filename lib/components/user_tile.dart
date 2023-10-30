// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: Colors.red),
            ],
          ),
        ));
  }
}
