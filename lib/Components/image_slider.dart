import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imageUrls = [
    "assets/HomePage/h-1.jpg",
    "assets/HomePage/h-2.jpg",
    "assets/HomePage/h-3.png",
    "assets/HomePage/h-4.png",
    "assets/HomePage/h-5.png",
    "assets/HomePage/h-6.png",
    "assets/HomePage/h-7.png",
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          CarouselSlider(
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: 800,
                    height: 700,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              // height: 400.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              //autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              initialPage: currentIndex,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < imageUrls.length; i++)
                buildIndicator(currentIndex == i)
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: isSelected ? 7 : 8,
        width: isSelected ? 30 : 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          shape: BoxShape.rectangle,
          color: isSelected ? const Color(0xff6C8FF8) : const Color(0xffCCCCCC),
        ),
      ),
    );
  }
}
