import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screens/homeScreen.dart';
import '../Screens/shop_keeper/Screen/reportScreen.dart';
import '../Screens/shop_keeper/Screen/shopKeeperScreen.dart';
import '../Screens/shop_keeper/auth/loginScreen.dart';

class ShopKeeperDrawer extends StatelessWidget {
  const ShopKeeperDrawer({super.key});

  void clearPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                'assets/shopKeeperLogo.svg',
                width: 90.0, // Adjust the width and height as needed
                height: 90.0,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              "Shop Keeper Dashboard",
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
                  leading: const Icon(
                    Icons.list_alt_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "List",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShopKeeperScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.report_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Report",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ShopKeeperReportScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: Colors.white,
                  ),
                  horizontalTitleGap: 80.0,
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    clearPrefs();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopKeeperLogin()));
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
