import 'dart:async';


import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../product/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoadingState());
      try{
        final dio = Dio();
        final response = await dio.get('https://6437d9f50c58d3b1457b143a.mockapi.io/Moto');
        final listDynamic = response.data as List;
        final List<Product> list = listDynamic.map((e) => Product.fromJson(e)).toList();
        emit(ProductLoadedState(list: list));
      }catch(err){
          print(err);
          emit(ProductErrorState(err: err.toString()));
      }
    });

  }
}
