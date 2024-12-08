import 'package:flutter/material.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

// qly số lượng spham
class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(height: 6,width: 50,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),),
        Expanded(
          child: ListView.builder(
          itemCount: 30,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                print("index ${index+1}");
              },
              child: SubtitleTextWidget(label: "${index +1}"));
          },),
        ),
      ],
    );
  }
}
