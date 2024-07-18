import 'package:flutter/material.dart';
import 'package:petcu/animation/slide_animation.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/media&color.dart';
import 'package:petcu/components/navbar.dart';
import 'package:petcu/components/title.dart';

class FirstAidScreen extends StatefulWidget {
  const FirstAidScreen({super.key});

  @override
  State<FirstAidScreen> createState() => _FirstAidScreenState();
}

class _FirstAidScreenState extends State<FirstAidScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(
              context,
              SlidePageRoute(page: BottomNavbar())
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black
          )
        ),
        title: appBarTitle(title: "General First Aid"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.05),
          firstAidCard(),
          SizedBox(height:  screenHeight * 0.03),
          firstAidCard(),
          SizedBox(height:  screenHeight * 0.03),
          firstAidCard(),
          SizedBox(height:  screenHeight * 0.03),
          firstAidCard(),
          SizedBox(height:  screenHeight * 0.03),

        ],
      )
    );
  }
}

