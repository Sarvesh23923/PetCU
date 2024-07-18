import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/components/media&color.dart'; // Ensure this path is correct
import 'package:petcu/ui/user/screens/first_aid_screen.dart';
import 'package:petcu/ui/user/screens/home_screen.dart';
import 'package:petcu/ui/user/screens/news.dart';
import 'package:petcu/ui/user/screens/profile_screen.dart';

class BottomNavbar extends StatefulWidget {
  final int initialIndex;

  const BottomNavbar({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  late int _currentIndex;
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pages.addAll([
      HomeScreen(),
      FirstAidScreen(),
      NewsScreen(),
      ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: screenHeight * 0.065,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5), // Adjusted margin
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.hardEdge,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: primaryColor,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              _buildNavItem('assets/images/navbar/dash.svg', 'Home', 0),
              _buildNavItem('assets/images/navbar/1st-aid.svg', '1st-Aid', 1),
              _buildNavItem('assets/images/navbar/news.svg', 'News', 2),
              _buildNavItem('assets/images/navbar/profile.svg', 'Profile', 3),
            ],
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String assetName, String label, int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 2),
        child: SvgPicture.asset(
          assetName,
          color: _currentIndex == index ? Colors.blue : Colors.white,
          height: screenHeight * 0.025,
          width: screenWidth * 0.025,
        ),
      ),
      label: label,
    );
  }
}
