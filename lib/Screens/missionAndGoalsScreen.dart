import 'package:flutter/material.dart';
import '../Components/homeDrawer.dart';
import '../Utils/animatedText.dart';

class MissionAndGoals extends StatelessWidget {
  const MissionAndGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text("Mission And Goals"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
        child: Container(
          width: double.infinity,
          height: 620,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            border: Border.all(width: 1.5, color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              CustomAnimatedText(),
              SizedBox(height: 20),
              Text(
                "We Can Save More Lifes With Your Helping Hand",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Your helping hand can make a difference! Join us in our goal to provide sustenance and hope to those facing hunger, contributing to the mission of saving lives through the power of nutritious food.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.food_bank_rounded),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Healthy Food",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "We save lives by providing essential, healthy meals, ensuring those in need get vital nutrients for well-being healthy food to those in need.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.money),
                  SizedBox(
                    width: 40,
                  ),
                  Text(
                    "Financial Support",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  "Contribute financial support for orphans, empowering their future and providing the care they deserve.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
