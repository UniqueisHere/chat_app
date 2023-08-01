import 'package:chat_app/core/constants/app_icons_and_images/app_icons_and_images.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  const ProfileAvatar({super.key, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          12,
        ),
      ),
      child: Image(
        image: const AssetImage(AppIconsAndImages.tempImageOne),
        height: size,
        width: size,
      ),
    );
  }
}
