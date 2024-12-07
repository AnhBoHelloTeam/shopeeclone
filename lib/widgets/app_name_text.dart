import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

//phan biet trang (mau cho trang)
class AppNameTextWidget extends StatelessWidget {
  final double fonsize;
  const AppNameTextWidget({super.key,this.fonsize=18});

  @override
  Widget build(BuildContext context) {
    //shimer là thư viện màu
    return Shimmer.fromColors(
      child: TitleTextWidget(label: "Clone Shoppe"),
      baseColor: Colors.purple,
      highlightColor: Colors.red,);
  }
}