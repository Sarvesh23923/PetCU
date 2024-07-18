import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IncidentPage extends StatefulWidget {
  const IncidentPage({super.key});

  @override
  State<IncidentPage> createState() => _IncidentPageState();
}

class _IncidentPageState extends State<IncidentPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){Navigator.pop(context);}, 
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          )
        ),
        title: Text(
          "Add Incident",
          style: GoogleFonts.roboto(
            fontSize: screenHeight * 0.025,
            fontWeight: FontWeight.w500
        ),
      ),
      centerTitle: true
    )
  );
  }
}