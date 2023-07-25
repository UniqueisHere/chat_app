import 'package:chat_app/core/constants/colors/colors.dart';
import 'package:chat_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  List<Widget>? appBarActions = [];
  final String title;
  CustomAppBar({super.key, required this.title, this.appBarActions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AllColors.scaffoldColor,
      actions: appBarActions,
      elevation: 2,
      title: CustomText(
        color: AllColors.textColor,
        size: 20,
        text: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
