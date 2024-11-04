import 'package:flutter/material.dart';
import 'package:furniture_app/config/state/theme_notifier.dart';
import 'package:furniture_app/config/widgets/w_bar.dart';
import 'package:furniture_app/config/widgets/w_star.dart';
import 'package:furniture_app/features/product/entity/model/product.dart';
import 'package:provider/provider.dart';

import '../resources/app_colors.dart';

class WProduct extends StatelessWidget {
  final GestureTapCallback onTap;
  final GestureTapCallback onStarTap;
  final GestureTapCallback onBarTap;
  final Product product;

  const WProduct({
    super.key,
    required this.onTap,
    required this.onBarTap,
    required this.onStarTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(builder: (context, model, child) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 220,
            minWidth: 155,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: model.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Hero(
                        tag: 'product_${product.itemNumber}',
                        child: Image.network(
                          product.image,
                          width: 140,
                          height: 140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Hero(
                    tag: "product_name_${product.itemNumber}",
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Item: ${product.itemNumber}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.category,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                      Text(
                        "\$ ${product.price}",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Column(
                    children: [
                      WStar(
                        color: const Color(0xFFEEEEEE),
                        isFilled: product.isLiked,
                        onTap: onStarTap,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      WBar(
                        onTap: onBarTap,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
