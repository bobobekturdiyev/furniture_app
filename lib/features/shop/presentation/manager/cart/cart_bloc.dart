import 'package:bloc/bloc.dart';
import 'package:furniture_app/features/product/entity/model/cart_product.dart';
import 'package:furniture_app/features/product/entity/model/product.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<CartProduct> products = [];

  CartBloc() : super(CartLoading()) {
    on<LoadCartProducts>((event, emit) {
      // products = Product.generate();
      emit(CartLoaded(products: products));
    });

    on<AddProduct>((event, emit) {
      emit(CartLoading());

      int i = 0;
      bool isFound = false;
      for (var item in products) {
        if (event.product.product.id == item.product.id) {
          products[i] = CartProduct(
              product: event.product.product,
              amount: item.amount + event.product.amount);
          isFound = true;
          break;
        }
        i++;
      }

      if (!isFound) {
        products.add(event.product);
      }
      emit(ProductAddedState());

      emit(CartLoaded(products: products));
    });

    on<IncreaseAmount>((event, emit) {
      emit(CartLoading());

      final product = products[event.index];

      products[event.index] = product.copyWith(amount: product.amount + 1);

      emit(CartLoaded(products: products));
    });

    on<DecreaseAmount>((event, emit) {
      emit(CartLoading());

      final product = products[event.index];

      if (product.amount > 1) {
        products[event.index] = product.copyWith(amount: product.amount - 1);
      } else {
        emit(RemoveProductState(
            index: event.index, product: products[event.index].product));
        emit(CartLoaded(products: products));
      }

      emit(CartLoaded(products: products));
    });

    on<RemoveProductEvent>((event, emit) {
      emit(CartLoading());

      products.removeAt(event.index);

      emit(CartLoaded(products: products));
    });
  }
}
