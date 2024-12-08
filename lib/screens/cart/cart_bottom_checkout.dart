import 'package:flutter/material.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 1,color: Colors.grey,
          ),
        ),
      ),
      child: SizedBox(
        height: kBottomNavigationBarHeight +20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child:
                       TitleTextWidget(label: "Tổng thanh toán (6 Sp/6 Items)")),
                    SubtitleTextWidget(
                      label: "Đ\19.000",
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Mua Hàng (0)"))
            ],
          ),
        ),
      ),
    );
  }
}
