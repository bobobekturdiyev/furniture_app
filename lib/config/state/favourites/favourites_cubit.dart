import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../features/product/entity/model/product.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  List<Product> products = [];

  FavouritesCubit() : super(FavouritesLoaded(products: const []));

  modifyProduct(Product product) {
    emit(FavouritesLoading());

    bool isFound = false;
    for (var element in products) {
      if (element.id == product.id) {
        isFound = true;
        products.remove(element);
        break;
        // mahsulot listda topildi
      }
    }

    // Topilmaganlikda ishlaydi
    if (!isFound) {
      final element = product.copyWith(isLiked: true);

      products.add(element);
    }

    emit(FavouritesLoaded(products: products));
  }
}
