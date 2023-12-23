import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter/material.dart';

class CustomImageStack extends StatelessWidget {
  CustomImageStack({super.key});

  final List<Widget> _avatars = [
    const CircleAvatar(
      backgroundImage: AssetImage("assets/volunteer.jpg"),
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/volunteer2.jpg"),
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/volunteer3.jpg"),
    ),
    const CircleAvatar(
      backgroundImage: AssetImage("assets/volunteer4.jpg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterImageStack.widgets(
        totalCount: 4,
        showTotalCount: true,
        itemRadius: 80, // Radius of each images
        itemCount: 4, // Maximum number of images to be shown in stack
        itemBorderWidth: 2,
        itemBorderColor: Colors.black,
        children: _avatars,
      ),
    );
  }
}
