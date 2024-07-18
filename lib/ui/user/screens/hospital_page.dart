import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/search_bar.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({Key? key}) : super(key: key);

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  Widget appBarTitle({required String title}) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
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
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: appBarTitle(title: "Locate Vet around you"),
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.05),
          searchBar(hint: 'Search'),
          SizedBox(height: screenHeight * 0.03),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            width: screenWidth * 0.9,
            height: screenHeight * 0.4,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Hello");
                    },
                    child: SvgPicture.asset(
                      "assets/images/relocate.svg",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.04),
          hospitalCard(
            hospitalName: "Well Care Vet ", 
            address: "Danville Street ,West view, \nMexico ,USA", 
            distance: "52 Km Away"
          ),

          SizedBox(height: screenHeight * 0.03),
          hospitalCard(
            hospitalName: "Well Care Vet ", 
            address: "Danville Street ,West view, \nMexico ,USA", 
            distance: "52 Km Away"
          ),

          SizedBox(height: screenHeight * 0.03),
          hospitalCard(
            hospitalName: "Well Care Vet ", 
            address: "Danville Street ,West view, \nMexico ,USA", 
            distance: "52 Km Away"
          ),

          SizedBox(height: screenHeight * 0.05)
        ],
      ),
    );
  }
}