import 'package:flutter/material.dart';
import 'models/book.dart';

class AddBookScreen extends StatelessWidget {
  final Function(Book) onAdd;

  AddBookScreen({super.key, required this.onAdd});

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _coverUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: _coverUrlController,
              decoration: const InputDecoration(labelText: 'Cover URL'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newBook = Book(
                  title: _titleController.text,
                  author: _authorController.text,
                  coverUrl: _coverUrlController.text,
                  description : _descriptionController.text,
                );
                onAdd(newBook);
                Navigator.pop(context);
              },
              child: const Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}
