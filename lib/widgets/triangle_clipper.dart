import 'package:flutter/material.dart';
import 'package:islami/helper/app_colors.dart';
import 'package:islami/helper/app_utils.dart';

class TriangleClipper extends StatelessWidget {
  final CustomClipper<Path> clipper;
  const TriangleClipper({super.key, required this.clipper});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: clipper,
      child: Container(
        width: AppUtils.width(context) * (70 / 430),
        height: AppUtils.height(context) * (90 / 932),
        color: AppColors.gold,
      ),
    );
  }
}


class LeftTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height,
      size.width,
      size.height * 0.3,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class RightTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.2, size.height, 0, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}