import 'package:flutter/material.dart';
import 'package:orphankor/Screens/Form/Screens/formScreen.dart';
import 'package:orphankor/Screens/galleryScreen.dart';
import '../Components/customContainer.dart';
import '../Components/homeDrawer.dart';
import '../Components/homeImageSlider.dart';
import 'aboutScreen.dart';
import 'contactScreen.dart';
import 'missionAndGoalsScreen.dart';
import 'shop_keeper/auth/loginScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text("OrphanKor"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ImageSlider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        asset: "assets/Icons/shopkeeper.svg",
                        title: "Shop Keeper",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShopKeeperLogin()));
                        },
                      ),
                      CustomContainer(
                        asset: "assets/Icons/form.svg",
                        title: "Form",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FormsScreen()));
                        },
                      ),
                      CustomContainer(
                        asset: "assets/Icons/mission.svg",
                        title: "Mission",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MissionAndGoals()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        asset: "assets/Icons/about.svg",
                        title: "About Us",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsScreen()));
                        },
                      ),
                      CustomContainer(
                        asset: "assets/Icons/contact-us.svg",
                        title: "Contact Us",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ContactsScreen()));
                        },
                      ),
                      CustomContainer(
                        asset: "assets/Icons/gallery.svg",
                        title: "Gallery",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GalleryScreen()));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
