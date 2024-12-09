import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        //background :colors.white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: (){},
      icon: const Icon(Ionicons.logo_google),
      label: Text("Sign in to Google"),
    );
  }
}