import 'package:flutter/material.dart';
import 'package:mydatingapp/components/customdrawer.dart';
import 'package:mydatingapp/components/customtext.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';
import 'package:mydatingapp/screens/editprofile.dart';
import 'package:mydatingapp/screens/likereceived.dart';
import 'package:mydatingapp/screens/profileview.dart';
import 'package:mydatingapp/screens/settings.dart';
import 'package:mydatingapp/screens/swippingscreen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int screenIndex = 0;
  List bottomtabs = [
    const SwippingScreen(),
    const AppSettings(),
    const LikeReceived(),
    const ProfileView(),
    const MyProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomText(
                      text: "DreamDate",
                      fontSize: 24,
                      fontWeight: FontWeight.w800),
                  const Icon(Icons.person),
                  const Icon(Icons.message),
                  GestureDetector(
                      onTap: () {
                        AuthController().logOutUserAccount();
                      },
                      child: const Icon(Icons.logout))
                ],
              ),
            ],
          ),
        ),
        drawer: const CustomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (indexNumber) {
            setState(() {
              screenIndex = indexNumber;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white12,
          currentIndex: screenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.remove_red_eye,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  size: 30,
                ),
                label: "Ree"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ac_unit_sharp,
                  size: 30,
                ),
                label: "Ree")
          ],
        ),
        body: bottomtabs[screenIndex]);
  }
}
