part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadingState extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<Product> list;

  const ProductLoadedState({required this.list});
  @override
  List<Object> get props => [list];
}

class ProductErrorState extends ProductState {
  final String err;

  const ProductErrorState({required this.err});
  @override
  List<Object> get props => [err];
}
