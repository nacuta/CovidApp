import 'package:flutter/material.dart';
import 'package:player/constant.dart';

class Counter extends StatelessWidget {
  final int? number;
  final Color? color;
  final String? tittle;
  const Counter({
    Key? key,
    this.number,
    this.color,
    this.tittle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color!.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color!,
                width: 2,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 25,
            color: color,
          ),
        ),
        Text(
          tittle!,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
