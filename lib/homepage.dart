import 'package:clipr/otp_auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FilledButton(
        child: Text("sign out "),
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Navigator.popAndPushNamed(context, "/login"!);
        },
      ),
    );
  }
}
