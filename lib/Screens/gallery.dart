import 'package:flutter/material.dart';

import '../Components/custom_container.dart';
import '../Components/drawer.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text("Gallery"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Center(
            child: CustomContainerForFood(
              asset: 'assets/FoodIcon.png',
              title: 'Donation',
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
