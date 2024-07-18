// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcu/components/buttons.dart';
import 'package:petcu/components/textfield.dart';
import 'package:petcu/ui/user/screens/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black
          )
        )
      ),

      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.1),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Enter Your Password !!!",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.bold,
              )
            ),
          ),

          SizedBox(height: screenHeight * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Please make sure to use the password that no one knows",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.015,
                color: Colors.grey.shade600
              )
            )
          ),

          SizedBox(height: screenHeight * 0.04),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "New Password",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold,
              )
            )
          ),

          SizedBox(height: screenHeight * 0.02),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20),
            child: PasswordField(
              hint: "Enter New Password", 
              screenHeight: screenHeight 
            )
          ),

          SizedBox(height: screenHeight * 0.03),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Re-Enter  Password",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold,
              )
            )
          ),

          SizedBox(height: screenHeight * 0.02),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20),
            child: PasswordField(
              hint: "Re-Enter New Password", 
              screenHeight: screenHeight 
            )
          ),

          SizedBox(height: screenHeight * 0.1),

          Center(
            child: MainButton(
              content: "Reset Password", 
              onPressed: (){
                Navigator.push(context, 
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                )
                );
              }
            ),
          )
        ],
      )
    );
  }
}
