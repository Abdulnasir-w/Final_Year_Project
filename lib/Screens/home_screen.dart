import 'package:flutter/material.dart';
import 'package:orphankor/Components/image_slider.dart';
import 'package:orphankor/Screens/aboutscreen.dart';
import 'package:orphankor/Screens/contact.dart';
import 'package:orphankor/Screens/gallery.dart';
import 'package:orphankor/Screens/mission_goals.dart';
import '../Components/custom_container.dart';
import 'Form/form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("OrphanKor"),
        ),
      ),
      //drawer: const CustomDrawer(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ImageSlider(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      asset: "assets/Icons/food.svg",
                      title: "Food",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FormsScreen()));
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
                                builder: (context) => const MissionAndGoals()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
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
                                builder: (context) => const ContactsScreen()));
                      },
                    ),
                    CustomContainer(
                      asset: "assets/Icons/gallery.svg",
                      title: "Gallery",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MissionAndGoals()));
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomContainer(
                      asset: "assets/Icons/shopkeeper.svg",
                      title: "Shoopkeeper",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GalleryScreen()));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
