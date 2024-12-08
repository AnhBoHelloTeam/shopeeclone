import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/screens/cart/qnt_btm_sheet_widget.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // kicsh thuoc man hinh
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl:
                      "https://cf.shopee.vn/file/vn-11134258-7ras8-m0sil68ehi1b66_xxhdpi",
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.5,
                          child: TitleTextWidget(
                            label: "Title" * 10,
                            maxLines: 3,
                          ),
                        ),
                        ////////////////////////////////
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////////
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                IconlyLight.heart,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        ////////////////////////////////
                      ],
                    ),
                    // lit chọn sản phẩm (mở ra loạt lựa chọn)
                   Align(
                      alignment: Alignment.centerLeft, 
                      child: SizedBox(
                        width: 200, // Đặt chiều rộng tùy ý
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              context: context,
                              builder: (context) {
                                return QuantityBottomSheetWidget();
                              },
                            );
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Bo góc nhẹ (8px)
                              ),
                            ),
                          ),
                          label: Text("Màu "),
                          icon: Icon(IconlyLight.arrowDownCircle),
                        ),
                      ),
                    ),


                        SizedBox(height: 10,),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
