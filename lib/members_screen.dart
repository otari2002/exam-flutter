import 'package:flutter/material.dart';
import 'drawer.dart';
import 'member_detail_screen.dart';
import 'add_member_screen.dart';
import 'models/member.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  MembersScreenState createState() => MembersScreenState();
}

class MembersScreenState extends State<MembersScreen> {
  final List<Member> members = [
    Member(name: 'Omar', lastName: 'Last1', memberId: '1'),
    Member(name: 'Otari',lastName: 'Last2',  memberId: '2'),
  ];
  final images = [
    Image.network('https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/sloth_lazybones_sluggard_avatar-512.png'),
    Image.network('https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/batman_hero_avatar_comics-512.png')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adhérents'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return ListTile(
            leading: images[index % 2],
            title: Text('${member.name} ${member.lastName}'),
            subtitle: Text('ID: ${member.memberId}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailScreen(member: member),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddMemberScreen(
                onAdd: (newMember) {
                  setState(() {
                    members.add(newMember);
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
