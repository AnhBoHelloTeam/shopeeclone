import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/custom_list_title.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //
    // khai báo trường sdung sang/toi
    final themeProvider = Provider.of<ThemeProvider>(context);
    //end theme provider
    //
    return Scaffold(
        appBar: AppBar(
          //  AppNameTextWidget ở file app_name_text.dart
          title: AppNameTextWidget(),
          // images appbar
          leading: Image.asset(AssetsManager.shoppingCart),
        ),
          // 

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: false,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TitleTextWidget(
                    label: "Please login to have ultimate access "),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 3,
                      ),
                      image: const DecorationImage(
                        image: NetworkImage("https://imagev3.vietnamplus.vn/w820/Uploaded/2024/mzdic/2024_11_13/ttxvn-ty-phu-elon-musk-1311-3606.jpg.webp"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleTextWidget(label: "NhanNG"),
                      SubtitleTextWidget(label: "Nhanhateku1@gmail.com"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleTextWidget(label: "general"),
                  // có sẵn form text, image,function
                  CustomListTitle(
                      imagePath: AssetsManager.orderSvg,
                      text: "All orders",
                      function: () {}),

                  CustomListTitle(
                      imagePath: AssetsManager.wishlistSvg,
                      text: "Wishlist",
                      function: () {}),

                  CustomListTitle(
                      imagePath: AssetsManager.recent,
                      text: "Views recently",
                      function: () {}),

                  CustomListTitle(
                      imagePath: AssetsManager.address,
                      text: "Address",
                      function: () {}),

                  //gạch
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  TitleTextWidget(
                    label: "Setting",
                  ),

                  // che do sang toi
                  SwitchListTile(
                    title: Text(themeProvider.getIsDarkTheme
                        ? "Dark Mode"
                        : "Light Mode"),
                    value: themeProvider.getIsDarkTheme,
                    onChanged: (value) {
                      themeProvider.setDarkTheme(themeValue: value);
                    },
                  ),
                  //end

                  //gạch
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ////////////////////////////////
                  /// icon chuc nang
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.login),
                      label:const Text("Login"),
                  ),),
                ],
              ),
            ),
          ],
        ));
  }
}
