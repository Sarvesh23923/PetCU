import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final double screenHeight;

  const CustomTextField({
    Key? key,
    required this.hint,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Color.fromRGBO(217, 127, 44, 1),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          fillColor: Colors.white,
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.roboto(
            fontSize: screenHeight * 0.017,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

class UserTextField extends StatelessWidget {
  final String hint;
  final double screenHeight;

  const UserTextField({
    Key? key,
    required this.hint,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            color: Color.fromRGBO(217, 144, 27, 1)
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          fillColor: Colors.white,
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: hint,
          hintStyle: GoogleFonts.roboto(
            fontSize: screenHeight * 0.017,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final String hint;
  final double screenHeight;

  const PasswordField({
    Key? key,
    required this.hint,
    required this.screenHeight,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        obscureText: !_isPasswordVisible,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromRGBO(217, 127, 44, 1),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color.fromRGBO(217, 127, 44, 1),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          fillColor: Colors.white,
          filled: false,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange),
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: widget.hint,
          hintStyle: GoogleFonts.roboto(
            fontSize: widget.screenHeight * 0.017,
          ),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
