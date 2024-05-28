import 'package:flutter/material.dart';

import 'drawer.dart';
import 'book_detail_screen.dart';
import 'add_book_screen.dart';
import 'models/book.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key});

  @override
  BooksScreenState createState() => BooksScreenState();
}

class BooksScreenState extends State<BooksScreen> {
  late TextEditingController _searchController;
  List<Book> books = [
    Book(
      title: 'Harry Potter and the Sorcerer\'s Stone',
      author: 'J.K. Rowling',
      coverUrl:
      'https://m.media-amazon.com/images/I/515W3XN03YL._AC_UF1000,1000_QL80_.jpg',
      description:
      'The first book in the Harry Potter series introduces young Harry as he discovers his magical heritage and attends Hogwarts School of Witchcraft and Wizardry.',
    ),
    Book(
      title: 'Star Wars: Light of the Jedi',
      author: 'Charles Soule',
      coverUrl:
      'https://static.wikia.nocookie.net/starwars/images/4/47/LightoftheJedi-art.jpg',
      description:
      'Set in the High Republic era, centuries before the Skywalker saga, this novel introduces new Jedi characters and a galactic threat that could bring the Republic to its knees.',
    ),
  ];

  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      filterBooks(_searchController.text);
    });
    filteredBooks.addAll(books);
  }

  void filterBooks(String query) {
    filteredBooks.clear();
    if (query.isEmpty) {
      filteredBooks.addAll(books);
    } else {
      filteredBooks.addAll(books.where((book) =>
      book.title.toLowerCase().contains(query.toLowerCase()) ||
          book.author.toLowerCase().contains(query.toLowerCase())));
    }
    setState(() {});
  }

  void deleteBook(Book book) {
    setState(() {
      books.remove(book);
      filteredBooks.remove(book);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Livres'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search books...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];
                return Dismissible(
                  key: Key(book.title),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    deleteBook(book);
                  },
                  child: ListTile(
                    leading: Image.network(
                      book.coverUrl,
                      width: 200,
                      height: 400,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://img.freepik.com/free-photo/cup-coffee-with-book-dark-surface_114579-77418.jpg",
                          width: 200,
                          height: 400,
                          fit: BoxFit.cover
                        );
                      },
                    ),
                    title: Text(book.title),
                    subtitle: Text(book.author),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BookDetailScreen(book: book),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddBookScreen(
                onAdd: (newBook) {
                  setState(() {
                    books.add(newBook);
                    filterBooks(_searchController.text);
                  });
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
