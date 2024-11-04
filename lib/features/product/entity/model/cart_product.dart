import 'package:furniture_app/features/product/entity/model/product.dart';

class CartProduct {
  final Product product;
  final int amount;

  const CartProduct({
    required this.product,
    required this.amount,
  });

  CartProduct copyWith({int? amount}) => CartProduct(
        product: product,
        amount: amount ?? this.amount,
      );
}
