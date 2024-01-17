import 'package:flutter/material.dart';
import 'package:orphankor/Screens/home_screen.dart';
import 'package:orphankor/Screens/shop_keeper/Screen/report.dart';
import 'package:orphankor/Screens/shop_keeper/Screen/shopkeeper.dart';
import 'package:orphankor/Screens/shop_keeper/auth/login_screen.dart';

class ShopKeeperDrawer extends StatelessWidget {
  const ShopKeeperDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
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
              "Shop Keeper",
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
                    Icons.report,
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
