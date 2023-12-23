import 'package:flutter/material.dart';
import 'package:orphankor/Components/button.dart';
import 'package:orphankor/Components/image_slider.dart';
import 'package:orphankor/Screens/aboutscreen.dart';
import '../Components/custom_container.dart';
import '../Components/drawer.dart';
import 'form.dart';

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
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  color: Colors.grey[400],
                  child: Column(
                    children: [
                      const SizedBox(height: 510, child: ImageSlider()),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                              title: "Submit Information", onPressed: () {}),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomButton(
                            title: "Read More",
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AboutUsScreen()));
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
              ),
              CustomContainerForFood(
                  asset: "assets/FoodIcon.png",
                  title: "Food",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormsScreen()));
                  }),
              CustomContainerForFood(
                asset: "assets/VolunteerIcon.png",
                title: "Volunteers",
                onPressed: () {},
              ),
              CustomContainerForFood(
                asset: "assets/DonationIcon.png",
                title: "Donations",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
