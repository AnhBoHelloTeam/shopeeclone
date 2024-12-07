import 'package:flutter/material.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TitleTextWidget(label: "Profile Screen",),
      ),
    );
  }
}