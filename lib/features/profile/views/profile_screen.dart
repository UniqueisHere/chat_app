import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColors.scaffoldColor,
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/temp/temp_image_one.png'),
            height: 80,
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 20,
            text: 'Niraj Pandey',
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 20,
            text: 'Halgada, Nepal',
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
                    text: '112',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: 'Followers',
                  ),
                ],
              ),
              Column(
                children: [
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: '112',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: 'Posts',
                  ),
                ],
              ),
              Column(
                children: [
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: '112',
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    color: AllColors.textColor,
                    size: 14,
                    text: 'Following',
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
