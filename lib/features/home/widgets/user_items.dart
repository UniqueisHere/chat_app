import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/widgets/custom_text.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/temp_image_one.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              CustomText(
                color: AllColors.textColor,
                size: 12,
                text: 'Niraj Pandey',
              ),
            ],
          ),
          const Image(
            image: AssetImage('assets/temp/iron_man.png'),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
