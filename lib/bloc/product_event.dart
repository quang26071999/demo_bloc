part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  const GetProductEvent();
  @override
  List<Object?> get props => [];
}
