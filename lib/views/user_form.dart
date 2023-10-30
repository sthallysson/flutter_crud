import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  UserForm({super.key});

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário de Usuario'),
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();

                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData["id"],
                      name: _formData["name"]!,
                      email: _formData["email"]!,
                      avatarUrl: _formData["avatarUrl"]!,
                    ),
                  );

                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nome Inválido!";
                  }

                  if (value.trim().length < 3) {
                    return "Nome Inválido!";
                  }

                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
