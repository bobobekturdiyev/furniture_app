import 'package:flutter/material.dart';
import 'package:furniture_app/config/resources/app_colors.dart';

enum WButtonType { white, orange, outline }

class WButton extends StatelessWidget {
  final String text;
  final WButtonType buttonType;
  final GestureTapCallback onTap;
  final double? width;
  final Color buttonColor;
  final Color textColor;

  const WButton({
    super.key,
    required this.text,
    this.buttonType = WButtonType.orange,
    required this.onTap,
    this.buttonColor = AppColors.primaryColor,
    this.textColor = const Color(0xFFFF6600),
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: buttonType == WButtonType.white
              ? Colors.white
              : const Color(0xFFFF6600),
          border: buttonType == WButtonType.outline
              ? Border.all(width: 1, color: Colors.white)
              : null,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: buttonType == WButtonType.white ? textColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
