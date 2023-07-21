import 'package:flutter/material.dart';

import 'custom_text.dart';

void customSnackBar({
  required BuildContext context,
  required CustomText customText,
  required Color backgroundColor,
  required int durationInSeconds,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: customText,
      backgroundColor: backgroundColor,
      dismissDirection: DismissDirection.up,
      duration: Duration(
        seconds: durationInSeconds,
      ),
    ),
  );
}
