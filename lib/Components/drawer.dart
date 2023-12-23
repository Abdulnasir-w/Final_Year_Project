import 'package:flutter/material.dart';
import 'package:orphankor/Screens/mission_goals.dart';
import '../Screens/aboutscreen.dart';
import '../Screens/contact.dart';
import '../Screens/form.dart';
import '../Screens/gallery.dart';
import '../Screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          const DrawerHeader(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/logo.png"),
              backgroundColor: Colors.transparent,
              maxRadius: 5.0,
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Khair Khegara",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 2,
            color: Colors.grey,
            indent: 50,
            endIndent: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 45),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.abc_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "About us",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.list_alt,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Forms",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormsScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.picture_in_picture_alt,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Gallery",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GalleryScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.medical_services_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Mission and Goals",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MissionAndGoals()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.contact_page_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Contacts",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactsScreen()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
