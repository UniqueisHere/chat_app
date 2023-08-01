import 'package:chat_app/core/constants/app_icons_and_images/app_icons_and_images.dart';
import 'package:chat_app/core/constants/app_texts/app_texts.dart';
import 'package:chat_app/core/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/widgets/custom_text.dart';

class UserItem extends StatelessWidget {
  final String userName;
  const UserItem({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24.0,
        left: 24.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const ProfileAvatar(),
              const SizedBox(
                width: 18,
              ),
              CustomText(
                color: AllColors.textColor,
                size: 12,
                text: userName,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Image(
            image: AssetImage(AppIconsAndImages.ironMan),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 12,
            text: AppTexts.longText,
          ),
        ],
      ),
    );
  }
}
