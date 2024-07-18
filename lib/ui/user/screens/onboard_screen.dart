import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petcu/components/media&color.dart';
import 'package:petcu/sheets/onboard_data.dart';
import 'package:petcu/ui/user/screens/userselection_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  final controller = OnboardDetails();
  final pageController = PageController();
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: controller.items.length,
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.1),
                      Container(
                        height: screenHeight * 0.55,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            controller.items[index].image,
                            height: screenHeight * 0.3,
                            width: screenWidth * 0.8,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        controller.items[index].title,
                        style: GoogleFonts.roboto(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        controller.items[index].description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: currentPageIndex != controller.items.length - 1
                  ? Row(
                      key: ValueKey('row'),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () =>
                              pageController.jumpToPage(controller.items.length - 1),
                          child: Text(
                            "Skip",
                            style: GoogleFonts.roboto(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Color.fromRGBO(217, 127, 44, 1),
                          child: IconButton(
                            onPressed: () => pageController.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn,
                            ),
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      key: ValueKey('center'),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Color.fromRGBO(217, 127, 44, 1),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) =>
                                    UserSelectionScreen(),
                                transitionsBuilder: (
                                  context,
                                  animation,
                                  secondaryAnimation,
                                  child,
                                ) {
                                  var begin = 0.0;
                                  var end = 1.0;
                                  var curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  return FadeTransition(
                                    opacity: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
