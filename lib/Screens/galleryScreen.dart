import 'package:flutter/material.dart';
import '../Components/homeDrawer.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> images = [
    "assets/Gallery/Gallery - 1.png",
    "assets/Gallery/Gallery - 2.png",
    "assets/Gallery/Gallery - 3.png",
    "assets/Gallery/Gallery - 4.png",
    "assets/Gallery/Gallery - 5.png",
    "assets/Gallery/Gallery - 6.png",
    "assets/Gallery/Gallery - 7.png",
    "assets/Gallery/Gallery - 8.png",
    // "assets/Gallery/Gallery - 9.jpg",
    "assets/Gallery/Gallery - 10.jpg",
    "assets/Gallery/Gallery - 11.jpg",
    "assets/Gallery/Gallery - 12.jpg",
    "assets/Gallery/Gallery - 13.jpg",
    "assets/Gallery/Gallery - 14.jpg",
    "assets/Gallery/Gallery - 15.jpg",
    "assets/Gallery/Gallery - 16.jpg",
    "assets/Gallery/Gallery - 17.jpg",
    "assets/Gallery/Gallery - 18.jpg",
    "assets/Gallery/Gallery - 19.jpg",
    "assets/Gallery/Gallery - 20.jpg",
    "assets/Gallery/Gallery - 21.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text("Gallery"),
        ),
      ),
      drawer: const CustomDrawer(),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: images.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => PhotoViewScreen(
            //                 imagePath: images[index],
            //               )));
            // },
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
