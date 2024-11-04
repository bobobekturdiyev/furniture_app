import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/config/widgets/w_settings_item.dart';
import 'package:furniture_app/features/profile/presentation/settings_screen.dart';

import '../../../config/resources/app_icons.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      appBar: AppBar(
        title: const Text("Profile"),
        titleSpacing: 0,
        backgroundColor: const Color(0xFFF5F6F7),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              _openSettings(context);
            },
            child: SvgPicture.asset(
              AppIcons.settings,
              colorFilter:
                  const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 60,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 100,
                  height: 100,
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
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&s",
                    ),
                  ),
                ),
                Positioned(
                  bottom: -5,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 20,
                      height: 20,
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6600).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: SvgPicture.asset(AppIcons.camera),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Hasan Mahmud",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "UI & UX designer",
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 50),
            const WSettingsItem(title: "My purchases", icon: AppIcons.wallet),
            const WSettingsItem(title: "My Address", icon: AppIcons.location),
            const WSettingsItem(
                title: "Payment Method", icon: AppIcons.paymentMethod),
            GestureDetector(
                onTap: () {
                  _openSettings(context);
                },
                child: const WSettingsItem(
                    title: "Settings", icon: AppIcons.settings)),
            const WSettingsItem(
              title: "Log Out",
              icon: AppIcons.logout,
              isDark: true,
            ),
          ],
        ),
      ),
    );
  }

  _openSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const SettingsScreen()));
  }
}
