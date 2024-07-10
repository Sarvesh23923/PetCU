// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcu/components/buttons.dart';
import 'package:petcu/components/textfield.dart';
import 'package:petcu/screens/login_screen.dart';
import 'package:petcu/screens/reset_password_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isChecked = false;

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () { Navigator.pop(context); }, 
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black
          )
        )
      ),

      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.07),
          Text(
            "Welcome to PEtCU 🐶",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: screenHeight * 0.03,
              fontWeight: FontWeight.w600,
            )
          ),
          SizedBox(height: screenHeight * 0.02),
          
          Text(
            "Create Your Account",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: screenHeight * 0.02,
              fontWeight: FontWeight.w400
            )
          ),
          SizedBox(height: screenHeight * 0.02),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "User Name",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          UserTextField(hint: "Enter your User Name", screenHeight: screenHeight),
          SizedBox(height: screenHeight * 0.03),
          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Email",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextField(hint: "Enter your email", screenHeight: screenHeight),
          SizedBox(height: screenHeight * 0.03),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Password",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          PasswordField(hint: "Enter your Password", screenHeight: screenHeight),
          SizedBox(height: screenHeight * 0.015),

          
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text(
                  "Stay Signed In",
                  style: GoogleFonts.roboto(
                    fontSize: screenHeight * 0.017,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: MainButton(
              content: "Sign Up", 
              onPressed: () {
                _navigateToPage(ResetPasswordScreen());
              }
            ),
          ),
          SizedBox(height: screenHeight * 0.07),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already a Contributor ?",
                style: GoogleFonts.roboto(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w500,
                )
              ),

              TextButton(
                onPressed: () {
                  _navigateToPage(LoginScreen());
                },
                child: Text(
                  "Sign In",
                  style: GoogleFonts.roboto(
                    fontSize: screenHeight * 0.02,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(217, 144, 27, 1)
                  )                
                )
              ),
            ]
          ),
          SizedBox(height: screenHeight * 0.1)
        ],
      )
    );
  }
}
