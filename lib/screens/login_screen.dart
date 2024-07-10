import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcu/components/buttons.dart'; 
import 'package:petcu/components/textfield.dart'; 
import 'package:petcu/screens/home_screen.dart';
import 'package:petcu/screens/otp_screen.dart';
import 'package:petcu/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.05),
          Center(
            child: Text(
              "Welcome back to PetCU 🐶",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Center(
            child: Text(
              "Login To Your Account",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "E-Mail (or) Username",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          CustomTextField(hint: "Enter your email or username", screenHeight: screenHeight),
          SizedBox(height: screenHeight * 0.03),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Password",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.017,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.015),
          PasswordField(hint: "Password", screenHeight: screenHeight),
          SizedBox(height: screenHeight * 0.01),
          Container(
            margin: EdgeInsets.only(left: 180),
            child: TextButton(
              onPressed: () {
                // PageRouteBuilder(
                //     pageBuilder: (context, animation, secondaryAnimation) => OtpScreen(),
                //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                //       const begin = Offset(1.0, 0.0);
                //       const end = Offset.zero;
                //       const curve = Curves.ease;

                //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                //       return SlideTransition(
                //         position: animation.drive(tween),
                //         child: child,
                //       );
                //     },
                //   );

                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => OtpScreen())
                );
                },
              child: Text(
                "Forget Password ?",
                style: GoogleFonts.roboto(
                  fontSize: screenHeight * 0.017,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: MainButton(
              content: "Login",
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
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
            ),
          ),
          SizedBox(height: screenHeight * 0.06),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                Text(
                  "Are you New to PetCU ?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: screenHeight * 0.02,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => SignupScreen(),
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
                    "Sign up",
                    style: GoogleFonts.roboto(
                      fontSize: screenHeight * 0.02,
                      color: Color.fromRGBO(217, 127, 44, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
