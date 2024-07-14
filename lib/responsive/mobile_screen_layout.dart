import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clones/constants/colors.dart';
import 'package:instagram_clones/models/user.dart' as model;
import 'package:instagram_clones/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      body: Center(
        child: Text(user.username),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "", backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "",
              backgroundColor: primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
              backgroundColor: primaryColor)
        ],
      ),
    );
  }
}
