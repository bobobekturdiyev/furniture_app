import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/app_icons.dart';

class WStar extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool isFilled;
  final Color color;

  const WStar({
    super.key,
    this.color = Colors.white,
    required this.onTap,
    this.isFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: isFilled
            ? const Icon(
                Icons.star,
                size: 12,
              )
            : SvgPicture.asset(AppIcons.star),
      ),
    );
  }
}
