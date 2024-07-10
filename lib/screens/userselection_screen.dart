// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/screens/login_screen.dart'; // Adjust the import as needed

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  @override
  State<UserSelectionScreen> createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  String selectedType = '';
  bool showContinueButton = false;

  void selectType(String type) {
    setState(() {
      selectedType = type;
      showContinueButton = true; // Show continue button when a type is selected
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Center(
              child: Text(
                "Select Login Type",
                style: GoogleFonts.roboto(
                  fontSize: screenWidth * 0.055,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Center(
              child: Text(
                "Please Select Your Login Type From The Below List",
                style: GoogleFonts.roboto(
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            buildSelectableContainer(
              screenWidth,
              screenHeight,
              "General User",
              "assets/images/user.svg",
            ),
            SizedBox(height: screenHeight * 0.05),
            buildSelectableContainer(
              screenWidth,
              screenHeight,
              "Doctor's Or Hospital",
              "assets/images/doctors.svg",
            ),
            SizedBox(height: screenHeight * 0.05),
            buildSelectableContainer(
              screenWidth,
              screenHeight,
              "Login as Guest",
              "assets/images/traveling.svg",
            ),
            SizedBox(height: screenHeight * 0.09),
            if (showContinueButton)
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Continue",
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(217, 127, 44, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectableContainer(
      double screenWidth, double screenHeight, String type, String iconPath) {
    bool isSelected = selectedType == type;
    return GestureDetector(
      onTap: () => selectType(type),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: screenWidth * 0.9,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Color.fromRGBO(217, 127, 44, 1) : Colors.transparent,
            width: isSelected ? 3 : 0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: screenWidth * 0.05),
            SvgPicture.asset(iconPath),
            SizedBox(width: screenWidth * 0.18),
            Text(
              type,
              style: GoogleFonts.roboto(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
