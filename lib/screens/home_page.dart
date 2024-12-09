import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/products/ctg_rounded_widget.dart';
import 'package:shopeeclone/widgets/products/latest_arrival_product.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //  AppNameTextWidget ở file app_name_text.dart
        title: AppNameTextWidget(),
        // images appbar
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
      //
      // xu ly banner
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(
                      AppConstants.bannersImage[index],
                    );
                  },
                  itemCount: AppConstants.bannersImage.length,
                  autoplay: true,
                  pagination: const SwiperPagination(
                      alignment: Alignment.bottomCenter,
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.white,
                        activeColor: Colors.red,
                      )),
                ),
              ),
          
              //
              //spham
              ////////////////////////////////////////////////////////////////
              SizedBox(
                height: 18,
              ),
              const TitleTextWidget(
                label: "Danh mục",
                fontSize: 22,
              ),
              ////////////////////////////////////////////////////////////////
              /// danh mục sản phẩm
              SizedBox(
                height: 14,
              ),
          
              SizedBox(
                height: size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    ///// widgets/products/latest_arrival_product.dart///xuu ly cac san pham
                    return LatesteArrivalProductsWidgets();
                  },
                ),
              ),
          
              const TitleTextWidget(
                label: "Gợi ý hôm nay",
                fontSize: 22,
              ),
              SizedBox(
                height: 2,
              ),
          //////////////////////////////////
          /// 1 lisst mới
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: 
                  List.generate(
                    AppConstants.categoriesList.length,
                    (index) {
                      // đã cấu hình ở ctg_rounded_widgets.dart
                      return CategoryRoundedWidget(
                        image: AppConstants.categoriesList[index].images,
                        name: AppConstants.categoriesList[index].name,
                      );
                  },),
              )
            ],
          ),
        ),
      ),
      //
      //
    );
  }
}