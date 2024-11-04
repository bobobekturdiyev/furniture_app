import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/config/resources/app_theme.dart';
import 'package:furniture_app/config/state/counter_cubit/counter_cubit.dart';
import 'package:furniture_app/config/state/counter_model.dart';
import 'package:furniture_app/config/state/favourites/favourites_cubit.dart';
import 'package:furniture_app/config/state/notification_model.dart';
import 'package:furniture_app/config/state/theme_notifier.dart';
import 'package:furniture_app/features/home/presentation/manager/home_screen_cubit.dart';
import 'package:furniture_app/features/shop/presentation/manager/cart/cart_bloc.dart';
import 'package:provider/provider.dart';

import 'config/routes/route.dart';

void main() {
  runApp(MyWindow());
}

class MyWindow extends StatelessWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterModel>(
          create: (BuildContext context) => CounterModel(),
        ),
        ChangeNotifierProvider<NotificationModel>(
          create: (BuildContext context) => NotificationModel(),
        ),
        ChangeNotifierProvider<ThemeNotifier>(
          create: (BuildContext context) => ThemeNotifier(),
        ),
        BlocProvider(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => FavouritesCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => HomeScreenCubit(),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) => CartBloc(),
        ),
      ],
      child: Consumer<ThemeNotifier>(builder: (context, model, child) {
        return MaterialApp.router(
          theme: AppTheme.defaultTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: model.themeMode,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
        );
      }),
    );
  }
}

// Widget
// Stateless va Stateful
