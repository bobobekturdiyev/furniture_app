import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_app/config/routes/route_path.dart';

import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/onboarding_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/home/presentation/app_main_screen.dart';
import '../../features/home/presentation/category_screen.dart';
import '../../features/home/presentation/favorites_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/product/entity/model/product.dart';
import '../../features/product/presentation/product_details_screen.dart';
import '../../features/profile/presentation/notification_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/profile/presentation/settings_screen.dart';
import '../../features/shop/presentation/cart_screen.dart';
import '../../features/shop/presentation/shop_screen.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AppMainRoute.page,
          path: RoutePath.main,
          initial: true,
          children: [
            // sub
            AutoRoute(
              page: HomeRoute.page,
              path: RoutePath.home,
            ),
            AutoRoute(
              page: ShopRoute.page,
              path: RoutePath.shop,
            ),
            AutoRoute(
              page: CartRoute.page,
              path: RoutePath.cart,
            ),
            AutoRoute(
              page: CategoryRoute.page,
              path: RoutePath.category,
            ),
            AutoRoute(
              page: FavoritesRoute.page,
              path: RoutePath.favourites,
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: RoutePath.profile,
            ),
          ],
        ),
        AutoRoute(
          page: ProductDetailsRoute.page,
          path: RoutePath.productDetails,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: RoutePath.login,
        ),
        AutoRoute(
          page: RegisterRoute.page,
          path: RoutePath.register,
        ),
        AutoRoute(
          page: OnboardingRoute.page,
          path: RoutePath.onboarding,
        ),
        AutoRoute(
          page: NotificationRoute.page,
          path: RoutePath.notification,
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: RoutePath.settings,
        ),
      ];
}
