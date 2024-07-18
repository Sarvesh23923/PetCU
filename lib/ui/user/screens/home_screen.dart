

// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petcu/animation/slide_animation.dart';
import 'package:petcu/components/media&color.dart';
import 'package:petcu/components/navbar.dart'; 
import 'package:petcu/ui/user/screens/fund_page.dart';
import 'package:petcu/ui/user/screens/hospital_page.dart';
import 'package:petcu/ui/user/screens/incident_page.dart';
import 'package:petcu/ui/user/screens/notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.3),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
              bottomLeft: Radius.circular(100),
            ),
          ),
          leadingWidth: screenWidth * 0.2,
          backgroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  SlidePageRoute(page: NotificationScreen())
                );
              },
              icon: SvgPicture.asset("assets/images/notify_icon.svg")),
              flexibleSpace: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  Text("Hello Jhon !",
                      style: GoogleFonts.roboto(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  SizedBox(height: screenHeight * 0.05),
                  Text("We Thank You, to join this Life \nSaving Momemt",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          fontSize: screenHeight * 0.025,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/images/profile_icon.svg")
                ),
              ],
            ),
          ),
          body: ListView(
            children: [
              SizedBox(height: screenHeight * 0.03),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Locate Nearby Vet",
                    style: GoogleFonts.roboto(
                      fontSize: screenHeight * 0.025,
                      fontWeight: FontWeight.w700))),
                SizedBox(height: screenHeight * 0.01),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HospitalScreen()));
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: primaryColor)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SvgPicture.asset("assets/images/container_bg.svg"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/images/dash-1.svg"),
                              Text("Tap To Locate the \nnearest Vet Hospital",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontSize: screenHeight * 0.023,
                                  fontWeight: FontWeight.w600
                                )
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Text("Rise Fund To Save Lives",
                        style: GoogleFonts.roboto(
                            fontSize: screenHeight * 0.025,
                            fontWeight: FontWeight.w700))),
                SizedBox(height: screenHeight * 0.01),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FundPage()));
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.17,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color.fromRGBO(217, 144, 17, 1))),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SvgPicture.asset("assets/images/container_bg.svg"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SvgPicture.asset("assets/images/fund.svg"),
                              Text("Tap To Rise Your \nvoice for fund rising",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontSize: screenHeight * 0.023,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    SizedBox(width: screenWidth * 0.3),
                    Text(
                      "Tap To Add Incident",
                        style: GoogleFonts.roboto(
                          fontSize: screenHeight * 0.025
                        )
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Container(
                      height: screenHeight * 0.07,
                      child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => IncidentPage()));
                          },
                          child: Icon(Icons.add,
                              color: primaryColor, 
                              size: screenHeight * 0.04
                          ),
                        backgroundColor: Color.fromRGBO(217, 217, 217, 1)
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.07)
              ],
            ),
      );
  }
}
