import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final int size;
  final Color color;
  final int? maxLines;
  final String text;
  final TextOverflow? overflow;
  const CustomText({
    super.key,
    required this.color,
    this.maxLines,
    required this.size,
    required this.text,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
