import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WSettingsItem extends StatelessWidget {
  final String title;
  final String icon;
  final Widget? suffix;
  final bool isDark;

  const WSettingsItem({
    super.key,
    required this.title,
    required this.icon,
    this.suffix,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFFFF6600) : Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.white : Color(0xFFFF6600).withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (suffix != null) ...{
            suffix!,
            // SvgPicture.asset(AppIcons.arrowRight),
          }
        ],
      ),
    );
  }
}
