import 'dart:async';
import 'package:flutter/material.dart';
import 'package:petcu/components/buttons.dart';
import 'package:petcu/ui/user/screens/reset_password_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _start = 30;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 0), () {});
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  void startTimer() {
    setState(() {
      _isButtonDisabled = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          timer.cancel();
          _isButtonDisabled = false;
          _start = 30; // Reset the timer
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.07),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Enter OTP",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Enter the OTP which was sent to your registered E-mail",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Pinput(
              length: 4,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              defaultPinTheme: PinTheme(
                width: screenWidth * 0.15,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                      width: screenWidth * 0.01,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.05),
          Container(
            margin: EdgeInsets.only(left: 230),
            child: _isButtonDisabled
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Resend OTP in",
                        style: GoogleFonts.roboto(
                          fontSize: screenHeight * 0.015,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        "$_start s",
                        style: GoogleFonts.roboto(
                          color: Colors.blue,
                          fontSize: screenHeight * 0.015,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: startTimer,
                      child: Text(
                        'Resend',
                        style: GoogleFonts.roboto(
                          fontSize: screenHeight * 0.017,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(217, 144, 27, 1),
                      ),
                    ),
                  ),
          ),
          SizedBox(height: screenHeight * 0.2),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 70),
            child: MainButton(
              content: "Reset Password",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResetPasswordScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
