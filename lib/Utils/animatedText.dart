import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  const CustomAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText(
          "Mission And Goals",
          textStyle: const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
        ),
      ],
      isRepeatingAnimation: true,
      repeatForever: true,
    );
  }
}
