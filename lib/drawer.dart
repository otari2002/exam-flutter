import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'books_screen.dart';
import 'members_screen.dart';
import '../about_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/library.png'),
                    radius: 40,
                  ),
                ),
                SizedBox(height: 10),
                Flexible(
                  child: Text(
                    'Omar Tahri',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    'Bibliothèque publique',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Livres'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BooksScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Adhérents'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MembersScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}
