import 'dart:io';
import 'package:flutter/foundation.dart'; // Để sử dụng kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  final XFile? pickedImage;
  final Function function;
  const PickImageWidget({super.key, this.pickedImage, required this.function});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: pickedImage == null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  )
                : kIsWeb
                    // Nếu đang chạy trên Web, sử dụng Image.network
                    ? Image.network(
                        pickedImage!.path,
                        fit: BoxFit.fill,
                      )
                    // Nếu không, sử dụng Image.file
                    : Image.file(
                        File(
                          pickedImage!.path,
                        ),
                        fit: BoxFit.fill,
                      ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: Colors.lightBlue,
            child: InkWell(
              splashColor: Colors.red,
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                function();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
