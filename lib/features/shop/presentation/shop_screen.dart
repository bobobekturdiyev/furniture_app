import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/config/state/counter_cubit/counter_cubit.dart';
import 'package:furniture_app/config/state/counter_model.dart';
import 'package:furniture_app/config/state/theme_notifier.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.redAccent,
          expandedHeight: 200,
          pinned: false,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "Programmer UZ ",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: false,
            expandedTitleScale: 1.3,
            titlePadding: EdgeInsets.only(left: 20, bottom: 16),
            collapseMode: CollapseMode.parallax,
            background: Image.asset(
              "assets/png/onboarding_1.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<CounterModel>(builder: (context, model, child) {
                  return Text("Counter: ${model.counter}");
                }),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterModel>().increment();
                  },
                  child: Text("+++"),
                ),
                BlocBuilder<CounterCubit, int>(
                  builder: (context, state) => Text("Cubit Counter: $state"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: Text("+++ Cubit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: Text("--- Cubit"),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeNotifier>().toggle();
                  },
                  child: Text(
                    "Change theme",
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
