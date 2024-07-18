import 'package:flutter/material.dart';
import 'package:petcu/components/card.dart';
import 'package:petcu/components/navbar.dart';
import 'package:petcu/ui/user/screens/home_screen.dart';
import 'package:petcu/ui/user/screens/hospital_page.dart';
import 'package:petcu/ui/user/screens/login_screen.dart';
import 'package:petcu/ui/user/screens/onboard_screen.dart';
import 'package:petcu/ui/user/screens/userselection_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = preferences.getInt('initScreen') ?? 0;
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initScreen == 0 ? 'onboard' : 'userselection',
      routes: {
        'login': (context) => LoginScreen(),
        'userselection': (context) => UserSelectionScreen(),
      },
      home: OnboardScreen()
    );
  }
}
