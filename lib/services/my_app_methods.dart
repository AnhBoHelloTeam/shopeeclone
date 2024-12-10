import 'package:flutter/material.dart';
import 'package:shopeeclone/services/assets_manager.dart';
import 'package:shopeeclone/widgets/subtitles_text.dart';
import 'package:shopeeclone/widgets/titles_text.dart';

class MyAppMethods {
  static Future<void> showErrorOrWarningDialog({
    required BuildContext context,
    required String subtite,
    required Function ftc,
    bool isError = true,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              Image.asset(
                AssetsManager.warning,
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 16,
              ),
              SubtitleTextWidget(
                label: subtite,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: !isError,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SubtitleTextWidget(
                              label: "Cancel", color: Colors.green))),
                  TextButton(
                      onPressed: () {
                        ftc();
                        Navigator.pop(context);
                      },
                      child: const SubtitleTextWidget(
                          label: "Ok", color: Colors.red))
                ],
              )
            ],
          ),
        );
      },
    );
  }

  static Future<void> imagePickerDialog({
    required BuildContext context,
    required Function cameraFCT,
    required Function galleryFCT,
    required Function remoteFCT,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: TitleTextWidget(
              label: "Choose option",
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ////////////////////////////////////////////////////////////////////////////////////////////////
                TextButton.icon(
                  onPressed: () {
                    cameraFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.camera),
                  label: const Text("camera"),
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////////
                TextButton.icon(
                  onPressed: () {
                    galleryFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.image),
                  label: const Text(
                    "Gallery",
                  ),
                ),
                ///////////////////////////////////////////////////////////////////////////////////////////////////
                TextButton.icon(
                  onPressed: () {
                    remoteFCT();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text(
                    "Remove",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
