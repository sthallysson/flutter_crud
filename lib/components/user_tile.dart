import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.USER_FORM, arguments: user);
                },
                icon: const Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Excluir Usuario'),
                        content: const Text('Tem certeza???'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Não'),
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                          TextButton(
                            child: const Text('Sim'),
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ],
                      ),
                    ).then((confirmed) {
                      if (confirmed) {
                        Provider.of<Users>(context, listen: false).remove(user);
                      }
                    });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red),
            ],
          ),
        ));
  }
}
