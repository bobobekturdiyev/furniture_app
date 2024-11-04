part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ProductAddedState extends CartState {}

class RemoveProductState extends CartState {
  final int index;
  final Product product;

  RemoveProductState({
    required this.index,
    required this.product,
  });
}

class CartLoaded extends CartState {
  final List<CartProduct> products;

  CartLoaded({
    required this.products,
  });
}

class CartLoading extends CartState {}
