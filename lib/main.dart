import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clones/constants/colors.dart';
import 'package:instagram_clones/providers/user_provider.dart';
import 'package:instagram_clones/responsive/mobile_screen_layout.dart';
import 'package:instagram_clones/responsive/responsive_layout.dart';
import 'package:instagram_clones/responsive/web_screen_layout.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:instagram_clones/screens/login_screen.dart';
import 'package:instagram_clones/screens/signup_screen.dart';
import 'package:provider/provider.dart';
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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          )
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram',
            theme: ThemeData.dark()
                .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                        mobileScreenLayout: MobileScreenLayout(),
                        webScreenLayout: WebScreenLayout());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }

                return const LoginScreen();
              },
            )));
  }
}
