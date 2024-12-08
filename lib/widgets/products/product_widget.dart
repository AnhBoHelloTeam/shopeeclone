import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/screens/cart/qnt_btm_sheet_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        print("màn hình sản phẩm cần biết");
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FancyShimmerImage(
              imageUrl: AppConstants.productImageUrl,
              height: size.height * 0.22,
              width: double.infinity,
            ),
          ),
          Row(
            children: [
              // bọc trong Flexible cả tràn ...
              Flexible(flex: 5,child: TitleTextWidget(label: "Ten san pham")),
              IconButton(
                onPressed: (){},
                 icon: Icon(IconlyLight.heart),
              ),
            ],
          ),

          Row(
            children: [
              const SubtitleTextWidget(
                label: "đ\16.000",
                fontSize: 20,
                color: Colors.orange,
              ),
              const Spacer(),
              OutlinedButton.icon(
                onPressed: () async {
                  await showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return QuantityBottomSheetWidget();
                    },
                  );
                },
                icon: Icon(IconlyLight.buy),
                label: Text("Đã bán 19.8K"),
              ),
            ],
          )

        ],
      ),
    );
  }
}
