import 'package:flutter/material.dart';

class OnboardData{
  final String title;
  final String description;
  final String image;

  OnboardData({
    required this.title,
    required this.description,
    required this.image
  });
}

class OnboardDetails{
  List<OnboardData> items = [
    OnboardData(
      title: 'Welcome to PetCU!', 
      description: "You have the power to help animals in your community. PetCU connects you with the resources to make a difference.", 
      image: "assets/images/Rectangle 2.svg"
    ),

    OnboardData(
      title: "Report Injured or Lost Animals Fast", 
      description: "Quickly report injured or lost animals and get them the help they deserve", 
      image: "assets/images/Rectangle 2.svg"
    ),

    OnboardData(
      title: "Find Vets for Urgent Animal Care", 
      description: "PetCU helps you locate veterinary professionals ready to assist animals in need.", 
      image: "assets/images/Rectangle 2.svg"
    ),
  ];
}

