import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainer extends StatelessWidget {
  final String asset;
  final String title;
  final VoidCallback onPressed;
  const CustomContainer({
    super.key,
    required this.asset,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(19),
                  bottomRight: Radius.circular(19)),
            ),
            child: Center(
                child: SvgPicture.asset(
              asset,
              width: 30,
              height: 30,
            )),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            //fontStyle: FontStyle.italic,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
