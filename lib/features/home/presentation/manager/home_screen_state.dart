part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Product> products;

  HomeScreenLoaded({required this.products});
}
