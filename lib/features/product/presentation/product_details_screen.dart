import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:furniture_app/config/resources/app_colors.dart';
import 'package:furniture_app/config/widgets/w_button.dart';
import 'package:furniture_app/features/product/entity/model/cart_product.dart';
import 'package:furniture_app/features/product/entity/model/product.dart';

import '../../../config/resources/app_icons.dart';
import '../../../config/widgets/w_bar.dart';
import '../../../config/widgets/w_star.dart';
import '../../shop/presentation/manager/cart/cart_bloc.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int productNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: Container(
          color: const Color(0xFFEEEEEE),
          padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: MediaQuery.of(context).padding.top + 8,
              bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.router.maybePop();
                },
                child: SvgPicture.asset(AppIcons.arrowLeft),
              ),
              const Text(
                "Product Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    decoration: const BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 270,
                          padding: const EdgeInsets.all(24.0),
                          child: Hero(
                            tag: "product_0",
                            child: Image.network(
                              widget.product.image,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (productNumber > 1) {
                                  setState(() {
                                    productNumber--;
                                  });
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDDDDDD),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                "${productNumber}",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  productNumber++;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 24,
                    child: Column(
                      children: [
                        WStar(
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        WBar(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              builder: (_) => BottomSheet(
                                onClosing: () {},
                                builder: (_) => Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 16,
                                        width: double.infinity,
                                      ),
                                      Text(
                                        "Price range",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      FlutterSlider(
                                        tooltip: FlutterSliderTooltip(
                                          textStyle: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                          boxStyle: FlutterSliderTooltipBox(
                                            decoration: BoxDecoration(
                                              color: Colors.redAccent
                                                  .withOpacity(0.7),
                                            ),
                                          ),
                                        ),
                                        values: [
                                          90,
                                          6500,
                                        ],
                                        min: 0,
                                        max: 20000,
                                        rangeSlider: true,
                                        trackBar: FlutterSliderTrackBar(
                                            activeTrackBarHeight: 5,
                                            inactiveDisabledTrackBarColor:
                                                Colors.redAccent,
                                            activeDisabledTrackBarColor:
                                                AppColors.primaryColor),
                                      ),
                                      Text(
                                        "Color",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Material",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Type of wood",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag: "product_name_0",
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Text(
                                    widget.product.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "item: ${widget.product.itemNumber}",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "Goal Design",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xFFAAAAAA),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$ ${widget.product.price}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AppColors.primaryColor,
                                    size: 13,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "(34)",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '''People have been using natural objects, such as tree stumps, rocks and moss, as furniture since the beginning of human civilisation. Archaeological research.''',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF888888),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Similar item",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (ctx, index) => Container(
                            width: 80,
                            height: 80,
                            padding: const EdgeInsets.all(8),
                            margin: EdgeInsets.only(right: index == 4 ? 0 : 8),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              "https://static.vecteezy.com/system/resources/previews/023/522/872/non_2x/modern-sofa-cutout-free-png.png",
                            ),
                          ),
                          itemCount: 5,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          if (state is ProductAddedState) {
            final snackBar = SnackBar(
              showCloseIcon: true,
              content: Text(
                "Mahsulot qo'shildi",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: AppColors.primaryColor,
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Container(
          width: double.infinity,
          height: 84,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              WButton(
                text: "Add to cart",
                onTap: () {
                  context.read<CartBloc>().add(
                        AddProduct(
                          product: CartProduct(
                            product: widget.product,
                            amount: productNumber,
                          ),
                        ),
                      );
                },
                width: null,
                buttonType: WButtonType.outline,
              ),
              WButton(
                text: "Buy now",
                width: null,
                buttonType: WButtonType.white,
                textColor: Colors.black,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
