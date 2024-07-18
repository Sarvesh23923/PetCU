import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:petcu/animation/slide_animation.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/navbar.dart';
import 'package:petcu/components/news_progress.dart';
import 'package:petcu/components/title.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  double percent = 0.0;


  @override
  void initState() {
    super.initState();
    Random random = Random();
    percent = random.nextDouble(); 

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
       
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              SlidePageRoute(page: BottomNavbar())
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        leadingWidth: screenHeight * 0.1,
        title: appBarTitle(title: "News Feed"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.04),
          NewsProgress(
            percent: Random().nextDouble(), 
            progressColor: Color.fromRGBO(226, 160, 73, 1)
          ),

          SizedBox(height: screenHeight * 0.04),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NewsProgress(
                percent: Random().nextDouble(),
                progressColor: Color.fromRGBO(46, 194, 187, 1),
              ),
      
              NewsProgress(
                percent: Random().nextDouble(),
                progressColor: Color.fromRGBO(44, 134, 217, 1),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.03),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "News Feed",
              style: GoogleFonts.roboto(
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          newsFeed(),
          SizedBox(height: screenHeight * 0.02),
          newsFeed(),
          SizedBox(height: screenHeight * 0.02),
          newsFeed(),
          SizedBox(height: screenHeight * 0.05)
        ],
      ),
    );
  }
}