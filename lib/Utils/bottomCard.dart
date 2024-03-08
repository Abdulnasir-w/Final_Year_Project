import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330,
      width: 500,
      color: Colors.grey,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              "Helping Hands For \nOrphans and Widows",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "About The Company",
              style: TextStyle(
                  fontSize: 22,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consecrate disciplining elite. ",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "KPK Swat, Kabal",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "+92 34893 23694",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "abdulnasir9323@gmail.com",
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
