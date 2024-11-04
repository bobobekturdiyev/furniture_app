part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class LoadCartProducts extends CartEvent {}

class AddProduct extends CartEvent {
  final CartProduct product;

  AddProduct({
    required this.product,
  });
}

class IncreaseAmount extends CartEvent {
  final int index;

  IncreaseAmount({
    required this.index,
  });
}

class DecreaseAmount extends CartEvent {
  final int index;

  DecreaseAmount({
    required this.index,
  });
}

class RemoveProductEvent extends CartEvent {
  final int index;

  RemoveProductEvent({
    required this.index,
  });
}
