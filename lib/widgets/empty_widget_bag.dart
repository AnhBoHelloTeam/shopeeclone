import 'package:flutter/material.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class EmptyBagWidget extends StatelessWidget {
  //Dòng này cho phép tạo widget EmptyBagWidget với dữ liệu tùy chỉnh
  final String imagePath, title, subtitles, buttonText;
  const EmptyBagWidget({super.key, required this.imagePath, required this.title, required this.subtitles, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    //MediaQuery để lấy kthước m/hình thiết bị (chiều rộng và chiều cao). Biến size sử dụng sau này để đặt kích thước cho các widget.
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            //Nen cart
            Image.asset(
              imagePath,
              height: size.height * 0.35,
              width: double.infinity,
            ),
            //Nen cart
            //Title
            TitleTextWidget(
              label: "Whoops",
              fontSize: 40,
              color: Colors.red,
            ),
      
            SizedBox(
              height: 20,
            ),
            SubtitleTextWidget(
              label: title,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
            SizedBox(
              height: 20,
            ),
            SubtitleTextWidget(
              label:subtitles,
              fontWeight: FontWeight.w400,
              fontSize: 25,
            ),
            SizedBox(
              height: 30,
            ),
            // Nút mua sắm
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20),
              ),
              onPressed: () {},
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
