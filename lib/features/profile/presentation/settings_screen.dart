import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/config/widgets/w_settings_item.dart';
import 'package:furniture_app/features/profile/presentation/notification_screen.dart';

import '../../../config/resources/app_icons.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      appBar: AppBar(
        title: const Text("Settings"),
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              AppIcons.arrowLeft,
              width: 24,
            ),
          ),
        ),
        backgroundColor: const Color(0xFFF5F6F7),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 54),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFFF6600),
                        width: 1.5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&s",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasan Mahmud",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "UI & UX designer",
                          style: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(AppIcons.arrowRight),
                ],
              ),
            ),
            const SizedBox(height: 48),
            WSettingsItem(
              title: "Your Activity",
              icon: AppIcons.activity,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
            WSettingsItem(
              title: "Book Mark",
              icon: AppIcons.bookmark,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
            WSettingsItem(
              title: "Language",
              icon: AppIcons.language,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const NotificationScreen()));
              },
              child: WSettingsItem(
                title: "Notification",
                icon: AppIcons.notification,
                suffix: Transform.scale(
                  scale: 0.5,
                  alignment: Alignment.centerRight,
                  child: Switch(
                    value: false,
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Colors.white,
                    inactiveThumbColor: Color(0xFFFF6600),
                    activeColor: Color(0xFFFF6600),
                    trackOutlineColor: WidgetStateProperty.resolveWith(
                      (final Set<WidgetState> states) {
                        return const Color(0xFFFF6600);
                      },
                    ),
                    onChanged: (bool value) {},
                  ),
                ),
              ),
            ),
            WSettingsItem(
              title: "Privacy",
              icon: AppIcons.privacy,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
            WSettingsItem(
              title: "Help center",
              icon: AppIcons.helpCenter,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
            WSettingsItem(
              title: "About us",
              icon: AppIcons.about,
              suffix: SvgPicture.asset(AppIcons.arrowRight),
            ),
          ],
        ),
      ),
    );
  }
}
