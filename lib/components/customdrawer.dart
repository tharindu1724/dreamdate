import 'package:flutter/material.dart';
import 'package:mydatingapp/controllers/image_uploader.dart';
import 'package:mydatingapp/screens/mainpage.dart';
import 'package:mydatingapp/screens/editprofile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mydatingapp/controllers/auth_controller.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  
var authController = AuthController.authController;
  @override
  Widget build(BuildContext context) {
    ImageUploader imageUploader = ImageUploader();
    return Drawer(
      child: Container(
          color: Colors.black12,
          child: ListView(
            children: [
              DrawerHeader(child: imageUploader.profileImage(context)),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("My Profile"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.notification_important),
                title: Text("Notifications"),
              ),
              const ListTile(
                leading: Icon(Icons.share),
                title: Text("Share"),
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          )),
    );
  }


}
