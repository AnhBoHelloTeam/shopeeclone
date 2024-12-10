import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopeeclone/consts/my_validators.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/app_name_text.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final TextEditingController _emailController;
  late final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
    }
    super.initState();
  }

  Future<void> _forgetPassFCT() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameTextWidget(
          fonsize: 22,
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
            child: ListView(
          //skrinWap: true
          padding: const EdgeInsets.symmetric(horizontal: 24),
          physics: const BouncingScrollPhysics(),
          children: [
            //section 1 -Header
            const SizedBox(
              height: 10,
            ),

            Image.asset(
              AssetsManager.forgotPassword,
              width: size.width * 0.6,
              height: size.height * 0.6,
            ),
            const SizedBox(
              height: 10,
            ),

            const TitleTextWidget(
              label: "Forgot Password",
              fontSize: 22,
            ),
            const SubtitleTextWidget(
              label:
                  "please enter the mail address you'd like your password...",
              fontSize: 14,
            ),
            const SizedBox(
              height: 40,
            ),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'youremail@gmail.com',
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(IconlyLight.message),
                      ),
                      filled: true,
                    ),
                    validator: (value) {
                      return Myvalidators.emailValidator(value);
                    },
                    onFieldSubmitted: (_) {
                      //move to the next field when the form is submitted
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(12),
                          //backgroundcolor: color red
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                      icon: const Icon(IconlyBold.send),
                      label: const Text(
                        "Request link",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () async {
                        _forgetPassFCT();
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
