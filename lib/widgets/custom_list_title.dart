import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';

// lấy lish bọc danh sách tên, ảnh,function
class CustomListTitle extends StatelessWidget {
  final String imagePath, text;
  final Function function;
  const CustomListTitle({
    super.key,
    required this.imagePath,
    required this.text,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(IconlyLight.arrowDown2),
    );
  }
}
