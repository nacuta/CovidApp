import 'package:flutter/material.dart';
import 'package:player/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'my_header.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About Covid-19",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SymptomsCard(
                        image: "assets/images/headache.png",
                        tittle: "Headache",
                        isActive: true,
                      ),
                      const SymptomsCard(
                        image: "assets/images/caugh.png",
                        tittle: "Caugh",
                      ),
                      const SymptomsCard(
                        image: "assets/images/fever.png",
                        tittle: "Fever",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Prevention", style: kTitleTextstyle),
                  const SizedBox(height: 20),
                  const PreventCard(
                    image: "assets/images/wear_mask.png",
                    tittle: "Whear face mask",
                    text:
                        "Since the start of the coronavirus outbreak some places have fully embraced wearing facemasks",
                  ),
                  const PreventCard(
                    image: "assets/images/wash_hands.png",
                    tittle: "Wash your hands",
                    text:
                        "Regular handwashing is one of the best ways to remove germs, avoid getting sick",
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String tittle;
  final String text;
  const PreventCard({
    Key? key,
    required this.image,
    required this.tittle,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 156,
        child: Stack(
          children: [
            Container(
              height: 136,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 8),
                    blurRadius: 24,
                    color: kShadowColor,
                  ),
                ],
              ),
            ),
            Image.asset(image),
            Positioned(
              left: 130,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                height: 136,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tittle,
                      style: kTitleTextstyle.copyWith(fontSize: 16),
                    ),
                    Text(
                      text,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset("assets/icons/forward.svg"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SymptomsCard extends StatelessWidget {
  final String image;
  final String tittle;
  final bool isActive;
  const SymptomsCard({
    Key? key,
    required this.image,
    required this.tittle,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90,
          ),
          Text(
            tittle,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
