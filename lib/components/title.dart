import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class appBarTitle extends StatelessWidget {
  final title;
  const appBarTitle({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: screenHeight * 0.025,
        fontWeight: FontWeight.w500,
      )
    );
  }
}