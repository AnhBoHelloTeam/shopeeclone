import 'package:flutter/material.dart';
import 'package:shopeeclone/screens/search_screen.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';

class CategoryRoundedWidget extends StatelessWidget {
  final String image, name;
  const CategoryRoundedWidget({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    // truyền widgets getstrucredertor để lấy ontap tưnhf icon tới từng link list từng spham
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, SearchScreen.routeName,arguments: name);
      },
      child: Column(
        children: [
          Image.asset(image,height: 50,width: 50,),
          SubtitleTextWidget(label: name, fontSize: 14,fontWeight: FontWeight.bold,)
        ],
      ),
    );
  }
}
