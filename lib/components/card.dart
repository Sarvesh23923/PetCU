import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/animation/slide_animation.dart';
import 'package:petcu/components/media&color.dart';
import 'package:petcu/components/navbar.dart';

class hospitalCard extends StatelessWidget {
  const hospitalCard({
    super.key,
    required this.hospitalName,
    required this.address,
    required this.distance,
  });

  final String hospitalName;
  final String address;
  final String distance;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth * 0.04,
      height: screenHeight * 0.14,
      child: Card(
        color: cardColor, 
        child: InkWell(
          onTap: () {},
          splashColor: primaryColor.withAlpha(30), 
          child: Row(
            children: [
              SizedBox(width: screenWidth * 0.03),
              CircleAvatar(
                radius: screenWidth * 0.08,
              ),
              Container(
                width: screenWidth * 0.3,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      hospitalName,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.001),
                    Text(
                      address,
                      style: GoogleFonts.roboto(
                        fontSize: screenHeight * 0.01,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth * 0.15,
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  distance,
                  style: GoogleFonts.roboto(
                    fontSize: screenHeight * 0.019,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class firstAidCard extends StatelessWidget {
  const firstAidCard({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth * 0.05,
      height: screenHeight * 0.14,
      child: Card(
        elevation: 10,
        color: cardColor,
        child: InkWell(
          onTap: (){},
          splashColor: primaryColor.withAlpha(30)
        )
      )
    );
  }
}

class notifyCard extends StatelessWidget {
  const notifyCard({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth * 0.05,
      height: screenHeight * 0.14,
      child: Card(
        elevation: 10,
        color: cardColor,
        child: InkWell(
          onTap: (){},
          splashColor: primaryColor.withAlpha(30)
        )
      )
    );
  }
}

class newsFeed extends StatelessWidget {
  const newsFeed({
    super.key,
   
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth * 0.05,
      height: screenHeight * 0.12,
      child: Card(
        elevation: 10,
        color: cardColor,
        child: InkWell(
          onTap: (){},
          splashColor: primaryColor.withAlpha(30)
        )
      )
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.onTap,
  });

  final String imagePath;
  final String title;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      child: Card(
        elevation: 10,
        color: cardColor,
        child: InkWell(
          onTap: onTap,
          splashColor: primaryColor.withAlpha(30),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Color.fromRGBO(217, 128, 44, 0.616),
                  child: SvgPicture.asset(
                    imagePath,
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: screenHeight * 0.025,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      description,
                      style: GoogleFonts.roboto(
                        fontSize: screenHeight * 0.01,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 63, 63, 63),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: screenWidth * 0.09,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}