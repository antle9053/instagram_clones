import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clones/constants/colors.dart';
import 'package:instagram_clones/responsive/mobile_screen_layout.dart';
import 'package:instagram_clones/responsive/responsive_layout.dart';
import 'package:instagram_clones/responsive/web_screen_layout.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instagram_clones/screens/login_screen.dart';
import 'package:instagram_clones/screens/signup_screen.dart';
import 'firebase_options.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram',
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home: const Scaffold(
          body: SignupScreen(),
          resizeToAvoidBottomInset: false,
        ));
  }
}
