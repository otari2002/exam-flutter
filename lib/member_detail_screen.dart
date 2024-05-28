import 'package:flutter/material.dart';
import 'models/member.dart';
import 'members_screen.dart';

class MemberDetailScreen extends StatelessWidget {
  final Member member;

  const MemberDetailScreen({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(member.name + " " + member.lastName),
        ),
    );
  }
}
