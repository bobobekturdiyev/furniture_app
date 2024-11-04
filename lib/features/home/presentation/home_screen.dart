import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/config/resources/app_colors.dart';
import 'package:furniture_app/config/resources/app_icons.dart';
import 'package:furniture_app/config/routes/route.dart';
import 'package:furniture_app/config/widgets/w_notification.dart';
import 'package:furniture_app/features/home/presentation/manager/home_screen_cubit.dart';
import 'package:furniture_app/features/home/presentation/widgets/w_slider_item.dart';

import '../../../config/state/favourites/favourites_cubit.dart';
import '../../../config/widgets/w_product.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearchState = false;
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      if (searchController.text.isEmpty && isSearchState) {
        setState(() {
          isSearchState = !isSearchState;
        });
      }
    });
  }

  submitSearch(BuildContext context) {
    if ((searchController.text.isNotEmpty && !isSearchState) ||
        (searchController.text.isEmpty && isSearchState)) {
      setState(() {
        isSearchState = !isSearchState;
        FocusScope.of(context).unfocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  isSearchState ? "Search" : "My Room",
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: TextField(
                controller: searchController,
                focusNode: searchFocusNode,
                textInputAction: TextInputAction.search,
                onSubmitted: (text) {
                  submitSearch(context);
                },
                decoration: InputDecoration(
                  hintText: 'Search...',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      submitSearch(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(AppIcons.search),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (!isSearchState) ...{
              _getMainState(context),
            } else ...{
              _getSearchState(context),
            },
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  _getSearchState(BuildContext context) => _getProductsGrid(productsNumber: 16);

  _getMainState(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemBuilder: (ctx, index) => Padding(
                padding:
                    EdgeInsets.only(left: 24.0, right: index == 3 ? 24 : 0),
                child: WSliderItem(
                  image: "assets/png/onboarding_1.png",
                  price: 520,
                  productName: "English or club sofa",
                  categoryName: "Goal Design",
                ),
              ),
              itemCount: 4,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular item",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // FocusScope.of(context).requestFocus(searchFocusNode);
                  },
                  child: const Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          _getProductsGrid(),
        ],
      );

  _getProductsGrid({
    int productsNumber = 8,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
          builder: (context, state) {
            if (state is HomeScreenLoading) {
              return CircularProgressIndicator();
            } else if (state is HomeScreenLoaded) {
              return GridView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 252,
                    mainAxisSpacing: 18),
                children: List.generate(
                  state.products.length,
                  (index) => WProduct(
                    onStarTap: () {
                      context.read<HomeScreenCubit>().likeProduct(index);

                      context
                          .read<FavouritesCubit>()
                          .modifyProduct(state.products[index]);
                    },
                    product: state.products[index],
                    onTap: () {
                      context.router.push(
                          ProductDetailsRoute(product: state.products[index]));
                    },
                    onBarTap: () {},
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
