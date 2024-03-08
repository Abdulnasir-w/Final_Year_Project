import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../Screens/Form/Screens/formScreen.dart';
import '../Screens/aboutScreen.dart';
import '../Screens/contactScreen.dart';
import '../Screens/galleryScreen.dart';
import '../Screens/homeScreen.dart';
import '../Screens/missionAndGoalsScreen.dart';
import '../Screens/shop_keeper/auth/loginScreen.dart';

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
              //backgroundColor: Colors.white,
              maxRadius: 20,
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "ORPHANKOR",
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
                    Icons.home_outlined,
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
                  leading: SvgPicture.asset(
                    'assets/Icons/about.svg', height: 25,
                    // ignore: deprecated_member_use
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
                  leading: SvgPicture.asset(
                    'assets/Icons/shopkeeper.svg', height: 25,
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "ShopKeeper",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopKeeperLogin()));
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/Icons/form.svg', height: 25,
                    // ignore: deprecated_member_use
                    //color: Colors.white,
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
                  leading: SvgPicture.asset(
                    'assets/Icons/gallery.svg', height: 25,
                    // ignore: deprecated_member_use
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
                  leading: SvgPicture.asset(
                    'assets/Icons/mission.svg', height: 25,
                    // ignore: deprecated_member_use
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
                  leading: SvgPicture.asset(
                    'assets/Icons/contact-us.svg',
                    width: 25,
                    height: 25,
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Contact Us",
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
