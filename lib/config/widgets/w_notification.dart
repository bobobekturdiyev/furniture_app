import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../resources/app_colors.dart';
import '../resources/app_icons.dart';
import '../routes/route_path.dart';
import '../state/notification_model.dart';

class WNotification extends StatelessWidget {
  const WNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.pushNamed(RoutePath.notification);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(
            AppIcons.notification,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          Positioned(
            right: -2,
            top: -2,
            child:
                Consumer<NotificationModel>(builder: (context, model, child) {
              if (model.hasNotification) {
                return Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }
}
