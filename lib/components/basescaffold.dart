import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/ui/user/screens/first_aid_screen.dart';
import 'package:petcu/ui/user/screens/home_screen.dart';
import 'package:petcu/ui/user/screens/news.dart';
import 'package:petcu/ui/user/screens/profile_screen.dart';

class BaseScaffold extends StatefulWidget {
  final int initialIndex;

  const BaseScaffold({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  late int _currentIndex;

  final List<Widget> _pages = const [
    HomeScreen(),
    FirstAidScreen(),
    NewsScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 144, 17, 1),
            borderRadius: BorderRadius.circular(30),
          ),
          clipBehavior: Clip.hardEdge,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            onTap: _onTabTapped,
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
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetName,
        color: _currentIndex == index ? Colors.blue : Colors.white,
        height: 24,
        width: 24,
      ),
      label: label,
    );
  }
}
