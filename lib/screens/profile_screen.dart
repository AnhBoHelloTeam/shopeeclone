import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopeeclone/models/user_model.dart';
import 'package:shopeeclone/providers/theme_provider.dart';
import 'package:shopeeclone/providers/user_provider.dart';
import 'package:shopeeclone/screens/auth/login.dart';
import 'package:shopeeclone/screens/auth/register.dart';
import 'package:shopeeclone/screens/inner_screens/viewed_recently.dart';
import 'package:shopeeclone/screens/inner_screens/wishlist_screen.dart';
import 'package:shopeeclone/screens/loading_manager.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/services/my_app_methods.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/custom_list_title.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = false;
  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fethUserInfo();
    } catch (error) {
      await MyAppMethods.showErrorOrWarningDialog(
          context: context,
          subtite: "An error has been occurend $error",
          ftc: () {});
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
     super.initState();
  }

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

        body: LoadingManager(
          isLoading: _isLoading,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: user== null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TitleTextWidget(
                        label: "Please login to have ultimate access "),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                userModel == null 
                  ? const SizedBox.shrink() 
                  : Padding(
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
                            color: Theme.of(context).colorScheme.surface,
                            width: 3,
                          ),
                          image:  DecorationImage(
                            image: NetworkImage(
                              userModel!.userImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitleTextWidget(label: userModel!.username),
                          SubtitleTextWidget(label: userModel!.userEmail),
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
                          text: "Danh sách yêu thích",
                          function: () {
                            Navigator.pushNamed(context, WishlistScreen.routeName);
                          }),
            
                      CustomListTitle(
                          imagePath: AssetsManager.recent,
                          text: "Views recently",
                          function: () {
                            Navigator.pushNamed(
                                context, RecentlyViewedScreen.routeName);
                          }),
            
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
                              )),
                          onPressed: () async {
                            if (user == null) {
                              Navigator.pushNamed(context, LoginScreen.routeName);
                            } else {
                              await MyAppMethods.showErrorOrWarningDialog(
                                  context: context,
                                  subtite: "Are you sure?",
                                  isError: false,
                                  ftc: () async {
                                    await FirebaseAuth.instance.signOut();
                                    if (!mounted) return;
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  });
                            }
                          },
                          icon: Icon(user == null ? Icons.login : Icons.logout),
                          label: Text(user == null ? "Login" : "Logout"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
