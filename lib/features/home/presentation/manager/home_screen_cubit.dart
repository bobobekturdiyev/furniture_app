import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../product/entity/model/product.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  List<Product> products = [];

  HomeScreenCubit() : super(HomeScreenLoaded(products: const [])) {
    emit(HomeScreenLoading());

    products = Product.generate();

    emit(HomeScreenLoaded(products: products));
  }

  likeProduct(int index) {
    emit(HomeScreenLoading());
    products[index] =
        products[index].copyWith(isLiked: !products[index].isLiked);

    print(products[index].isLiked);

    emit(HomeScreenLoaded(products: products));
  }
}
