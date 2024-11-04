import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_app/config/resources/app_colors.dart';
import 'package:furniture_app/config/widgets/w_button.dart';
import 'package:furniture_app/features/product/entity/model/cart_product.dart';
import 'package:furniture_app/features/shop/presentation/manager/cart/cart_bloc.dart';

@RoutePage()
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F7),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: Container(
          color: const Color(0xFFF5F6F7),
          padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: MediaQuery.of(context).padding.top + 8,
              bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Shopping Cart",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is RemoveProductState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  barrierColor: AppColors.primaryColor.withOpacity(0.8),
                  builder: (_) => AlertDialog(
                    backgroundColor: Color(0xFFFEFEFE),
                    title: Text("Diqqat!"),
                    content: Text(
                        "Haqiqatda ham ${state.product.name}ni o'chirmoqchimisiz?"),
                    actions: [
                      WButton(
                        text: "Ha, o'chirish",
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveProductEvent(index: state.index));
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      WButton(
                        text: "Bekor qilish",
                        buttonType: WButtonType.white,
                        buttonColor: Colors.transparent,
                        textColor: Colors.black,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              }
            },
            child: BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                if (state is CartLoaded) {
                  return Column(
                    children: [
                      ListView.builder(
                        itemBuilder: (_, index) =>
                            _getCartItem(state.products[index], index),
                        itemCount: state.products.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      if (state.products.isEmpty) ...{
                        Text("Cart is empty"),
                      } else ...{
                        WButton(
                          text: 'Continue to payment',
                          onTap: () {},
                        ),
                      },
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  _getCartItem(CartProduct cartProduct, int index) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 100,
        maxWidth: double.infinity,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.network(
              cartProduct.product.image,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cartProduct.product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  cartProduct.product.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 9,
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$ ${cartProduct.product.price}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: 60,
              minHeight: 25,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(DecreaseAmount(index: index));
                  },
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 2,
                    ),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "${cartProduct.amount}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CartBloc>().add(IncreaseAmount(index: index));
                  },
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4.0,
                      vertical: 2,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
