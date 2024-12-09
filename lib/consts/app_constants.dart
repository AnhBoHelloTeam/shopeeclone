//xu li link anh
import 'package:shopeeclone/models/category_models.dart';
import 'package:shopeeclone/services/assets_manager.dart';

class AppConstants {
  static String productImageUrl =
      "https://cf.shopee.vn/file/vn-11134258-7ras8-m0sil68ehi1b66_xxhdpi";

  //banner
  static List<String> bannersImage = [
    AssetsManager.banner1,
    AssetsManager.banner2,
  ];
// laasy trường ở models/category_models.dart
  static List<CategoryModels> categoriesList = [
    CategoryModels(
      id: "iphone",
      images: AssetsManager.mobiles,
      name: "phones"
    ),
    CategoryModels(
      id: "Shoes",
      images: AssetsManager.shoes,
      name: "Shoes"
    ),
    CategoryModels(
      id: "Books",
      images: AssetsManager.book,
      name: "Books"
    ),
    CategoryModels(
      id: "cosmetics",
      images: AssetsManager.cosmetics,
      name: "cosmetics"
    ),
    CategoryModels(
      id: "watch",
      images: AssetsManager.watch,
      name: "watch"
    ),
    CategoryModels(
      id: "Laptop",
      images: AssetsManager.pc,
      name: "Laptop"
    ),
    CategoryModels(
      id: "electronics",
      images: AssetsManager.electronics,
      name: "electronics"
    ),
  ];
}
