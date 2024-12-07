import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleTextWidget(label: "This is the Title",fontSize: 60,),
        //SubtitleTextWidget lấy trong subtitles_text.dart
        SubtitleTextWidget(label:"hi, Again",color: Colors.red),


      ],
    ));
  }
}
