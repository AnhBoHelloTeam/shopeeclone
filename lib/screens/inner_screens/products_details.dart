import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
///// nhấn vào hình sẽ qua sản phẩm
class ProductsDetails extends StatefulWidget {
  static const routeName = "/ProductsDetails";
  const ProductsDetails({super.key});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: const AppNameTextWidget(
            fonsize: 20,
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){
                Navigator.canPop(context) ? Navigator.pop(context): null;
              },
              icon: const Icon(
                Icons.arrow_back_ios
              ),
            ),
          )),

          //
          ///
          /// Hiển thị chi tiết sản phẩm
          body: Column(
            children: [
              FancyShimmerImage(
                imageUrl: AppConstants.productImageUrl,
                height: size.height*0.38,
                width: double.infinity,
                boxFit: BoxFit.contain,
              ),
              //// tieeu đề sản phẩm
              const SizedBox(height: 15,),
              ///
              Column(
                children: [
                  Row(
                    children: [
                      //co giãn một cách linh hoạt nhưng không bị ép buộc chiếm toàn bộ không gian.
                      Flexible(
                        child: Text(
                          "Title"*16,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    SizedBox(height: 15,),
                    const SubtitleTextWidget(
                      label: "Đ\16.000",
                      color: Colors.orange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ],
                  )
                ],
              )
            ],
          ),
    );
  }
}
