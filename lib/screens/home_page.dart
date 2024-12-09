import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shopeeclone/consts/app_constants.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/products/latest_arrival_product.dart';
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
      // Thanh tìm kiếm
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 219, 79, 9), // Màu Shopee
        title: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12), // Bo góc tìm kiếm
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm sản phẩm, thương hiệu...",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), // Bo góc cho viền
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.notifications_none, color: Colors.white),
            const SizedBox(width: 8),
            const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Bo góc banner
              child: SizedBox(
                height: size.height * 0.24,
                child: Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(
                      AppConstants.bannersImage[index],
                      fit: BoxFit.cover,
                    );
                  },
                  itemCount: AppConstants.bannersImage.length,
                  autoplay: true,
                  pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                      color: Colors.white,
                      activeColor: Colors.red,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),
            // Danh mục
            const TitleTextWidget(
              label: "Danh mục",
              fontSize: 22,
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const LatesteArrivalProductsWidgets(); // Widget sản phẩm
                },
              ),
            ),
            const SizedBox(height: 18),

            // Gợi ý hôm nay
            const TitleTextWidget(
              label: "Gợi ý hôm nay",
              fontSize: 22,
            ),
            const SizedBox(height: 18),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 cột
                  mainAxisSpacing: 10, // Khoảng cách dọc
                  crossAxisSpacing: 10, // Khoảng cách ngang
                  childAspectRatio: 0.7, // Tỷ lệ chiều cao / chiều rộng
                ),
                itemCount: 8, // Số lượng sản phẩm
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hình ảnh sản phẩm
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8),
                            ),
                            child: Image.asset(
                              'assets/images/product_$index.jpg', // Đường dẫn ảnh sản phẩm
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        // Thông tin sản phẩm
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sản phẩm $index",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "₫${(index + 1) * 10000}",
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.orange, size: 16),
                                  Text("4.9 (120)"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
