import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsProgress extends StatelessWidget {
  const NewsProgress({
    super.key,
    required this.percent,
    required this.progressColor,
  });

  final double percent;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: percent),
      duration: Duration(seconds: 5),
      builder: (context, value, child) {
        int displayedValue = (value * 200).round(); 
        return CircularPercentIndicator(
          radius: 50,
          lineWidth: 15,
          center: Text(
            '$displayedValue',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: progressColor,
          percent: value,
        );
      },
    );
  }
}