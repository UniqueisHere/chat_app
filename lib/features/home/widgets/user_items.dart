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
              Image.asset(
                'assets/temp/temp_image_one.png',
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
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
            image: AssetImage('assets/temp/iron_man.png'),
          ),
          const SizedBox(
            height: 12,
          ),
          CustomText(
            color: AllColors.textColor,
            size: 12,
            text:
                'Any thing that really doesnt matter but it still has to go here and occuoy the space to make it look attractive.',
          ),
        ],
      ),
    );
  }
}
