import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/screens/cart_screen.dart';
import 'package:shopeeclone/screens/home_page.dart';
import 'package:shopeeclone/screens/profile_screen.dart';
import 'package:shopeeclone/screens/search_screen.dart';
// điều hướng thanh công cụ tới các trang
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late PageController controller;
  int currentScreen = 0;
  // 1 list tới các trang cần điều hướng
  List<Widget> screens = [
    HomePage(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: screens),
          //NavigationBar taapj trung xử lí tác vụ thanh bottom
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentScreen, // lấy trang vào insex
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: kBottomNavigationBarHeight,
        elevation: 2,
        onDestinationSelected: (value) {
          setState(() {
            currentScreen = value;
          });
          //nhayr trang (dieu huong cac trang)
          controller.jumpToPage(currentScreen);
        },
        destinations: [
          NavigationDestination(
              selectedIcon: Icon(IconlyBold.home),
              icon: Icon(IconlyLight.home),
              label: "Home"),
          NavigationDestination(
              selectedIcon: Icon(IconlyBold.search),
              icon: Icon(IconlyLight.search),
              label: "search"),
          NavigationDestination(
              selectedIcon: Icon(IconlyBold.bag2),
              icon: Icon(IconlyLight.bag2),
              label: "Cart"),
          NavigationDestination(
              selectedIcon: Icon(IconlyBold.profile),
              icon: Icon(IconlyLight.profile),
              label: "profile"),
        ],
      ),
    );
  }
}
