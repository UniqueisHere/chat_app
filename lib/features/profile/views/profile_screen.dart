import 'package:chat_app/core/constants/app_texts/app_texts.dart';
import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/constants/routes/routes.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:chat_app/core/widgets/profile_avatar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../layout/custom_appbar.dart';
import '../widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.scaffoldColor,
      appBar: CustomAppBar(
        title: AppTexts.fiveMinFlutter,
        appBarActions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.logout:
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).popAndPushNamed(Routes.login);
                  break;
                case ProfileMenu.editProfile:
                  Navigator.of(context).pushNamed(Routes.editProfile);
                  break;
                default:
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem<ProfileMenu>(
                  value: ProfileMenu.logout,
                  child: Text(AppTexts.logout),
                ),
                const PopupMenuItem<ProfileMenu>(
                  value: ProfileMenu.editProfile,
                  child: Text(AppTexts.editProfile),
                ),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          const ProfileAvatar(
            size: 90,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 20,
            text: AppTexts.nirajPandey,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 20,
            text: AppTexts.nirajPandeyLocation,
            // fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.count,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.followers,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.count,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.posts,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.count,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: AppTexts.following,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
            height: 3,
          )
        ],
      ),
    );
  }
}
