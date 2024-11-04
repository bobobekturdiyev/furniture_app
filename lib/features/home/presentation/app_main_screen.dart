import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/config/resources/app_icons.dart';
import 'package:furniture_app/config/routes/route.dart';

@RoutePage()
class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CartRoute(),
        CategoryRoute(),
        FavoritesRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          backgroundColor: const Color(0xFFF5F6F7),
          bottomNavigationBar: Container(
            width: double.infinity,
            constraints: const BoxConstraints(minHeight: 65),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _getBottomItem(
                    icon: AppIcons.home,
                    isActive: tabsRouter.activeIndex == 0,
                    onTap: () {
                      tabsRouter.setActiveIndex(0);
                    }),
                _getBottomItem(
                    icon: AppIcons.shop,
                    isActive: tabsRouter.activeIndex == 1,
                    onTap: () {
                      tabsRouter.setActiveIndex(1);
                    }),
                _getBottomItem(
                    icon: AppIcons.mine,
                    isActive: tabsRouter.activeIndex == 2,
                    onTap: () {
                      tabsRouter.setActiveIndex(2);
                    }),
                _getBottomItem(
                    icon: AppIcons.star,
                    isActive: tabsRouter.activeIndex == 3,
                    onTap: () {
                      tabsRouter.setActiveIndex(3);
                    }),
                _getBottomItem(
                    icon: AppIcons.user,
                    isActive: tabsRouter.activeIndex == 4,
                    onTap: () {
                      tabsRouter.setActiveIndex(4);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  _getBottomItem({
    bool isActive = false,
    required String icon,
    required GestureTapCallback onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: isActive ? const Color(0xFFFF6600) : null,
              borderRadius: BorderRadius.circular(8)),
          child: SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
