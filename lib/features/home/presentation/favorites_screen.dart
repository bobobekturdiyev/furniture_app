import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/config/state/favourites/favourites_cubit.dart';

import '../../../config/resources/app_colors.dart';
import '../../../config/resources/app_icons.dart';
import '../../../config/widgets/w_notification.dart';
import '../../../config/widgets/w_product.dart';
import 'manager/home_screen_cubit.dart';

@RoutePage()
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 80),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppIcons.menu),
                ),
                const Text(
                  "Favourites",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WNotification(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            _getProductsGrid(),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  _getProductsGrid({
    int productsNumber = 8,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<FavouritesCubit, FavouritesState>(
          builder: (context, state) {
            if (state is FavouritesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavouritesLoaded) {
              if (state.products.isEmpty) {
                return const Center(
                  child: Text("Favourites list is empty"),
                );
              }

              return GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 252,
                    mainAxisSpacing: 18),
                children: List.generate(
                  state.products.length,
                  (index) => WProduct(
                    onTap: () {},
                    onBarTap: () {},
                    onStarTap: () {
                      context.read<HomeScreenCubit>().likeProduct(index);

                      context
                          .read<FavouritesCubit>()
                          .modifyProduct(state.products[index]);
                    },
                    product: state.products[index],
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      );
}
