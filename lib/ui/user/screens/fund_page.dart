import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FundPage extends StatefulWidget {
  const FundPage({super.key});

  @override
  _FundPageState createState() => _FundPageState();
}

class _FundPageState extends State<FundPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.2),
          Center(
            child: RotationTransition(
              turns: _controller,
              child: SvgPicture.asset("assets/images/hourglass.svg"),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Text(
            textAlign: TextAlign.center,
            "Raise your voice for fund raising. \nSoon it will be enabled",
            style: GoogleFonts.roboto(
              fontSize: screenHeight * 0.025,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
