import 'package:flutter/material.dart';
import 'models/member.dart';

class AddMemberScreen extends StatelessWidget {
  final Function(Member) onAdd;

  AddMemberScreen({super.key, required this.onAdd});

  final _nameController = TextEditingController();
  final _memberIdController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _memberIdController,
              decoration: const InputDecoration(labelText: 'Member ID'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newMember = Member(
                  name: _nameController.text,
                  lastName: _lastNameController.text,
                  memberId: _memberIdController.text,
                );
                onAdd(newMember);
                Navigator.pop(context);
              },
              child: const Text('Add Member'),
            ),
          ],
        ),
      ),
    );
  }
}
