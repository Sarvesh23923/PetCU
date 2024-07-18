import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcu/animation/slide_animation.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/media&color.dart';
import 'package:petcu/ui/user/screens/fund_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          icon: Icon(Icons.arrow_back_ios),
        ),
        leadingWidth: screenWidth * 0.2,
        title: Text(
          "Profile",
          style: GoogleFonts.roboto(
            fontSize: screenHeight * 0.03,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.04),
          CircleAvatar(radius: 70, backgroundColor: primaryColor),
          SizedBox(height: screenHeight * 0.03),
          Text(
            "Jhon Dass",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            "jhondass5682@gmail.com",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: screenHeight * 0.018,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          ProfileCard(
            imagePath: "assets/images/prof-1.svg", 
            title: "General Info", 
            description: "Name, Email, Mob No", 
            onTap: () {}, // Add any relevant action here
          ),
          SizedBox(height: screenHeight * 0.03),
          ProfileCard(
            imagePath: "assets/images/verified.svg", 
            title: "Verification", 
            description: "Get verified to raise the fund to save a life", 
            onTap: () {
              Navigator.push(
                context, 
                SlidePageRoute(page: FundPage())
              );
            },
          ),
          SizedBox(height: screenHeight * 0.03),
          ProfileCard(
            imagePath: "assets/images/logout.svg", 
            title: "Log out", 
            description: "Log out of the application", 
            onTap: () {
              // Add log out functionality here
            },
          ),
        ],
      ),
    );
  }
}
