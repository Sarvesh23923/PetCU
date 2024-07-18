import 'package:flutter/material.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/title.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back_ios,
          )
        ),
        title: appBarTitle(title: "Notification"),
        centerTitle: true
      ),
      
      body: ListView(
        children: [
          SizedBox(height: screenHeight * 0.05),
          notifyCard(),
          SizedBox(height: screenHeight * 0.04),
          notifyCard(),
          SizedBox(height: screenHeight * 0.04),
          notifyCard(),
          SizedBox(height: screenHeight * 0.04),
          notifyCard(),
        ]
      )
    );
  }
}