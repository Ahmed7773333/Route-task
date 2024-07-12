import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/eror/failuers.dart';
import '../../data/models/products_model.dart';
import '../../domain/usecases/get_all_products.dart';

part 'home_layout_event.dart';
part 'home_layout_state.dart';

class HomeLayoutBloc extends Bloc<HomeLayoutEvent, HomeLayoutState> {
  static HomeLayoutBloc get(context) => BlocProvider.of(context);
  DateTime initTime = DateTime.now();
  GetAllProducts getAllProducts;
  List<Products> productsList = [];

  HomeLayoutBloc(
    this.getAllProducts,
  ) : super(HomeLayoutInitial()) {
    on<HomeLayoutEvent>((event, emit) async {
      if (event is GetAllProductsEvent) {
        emit(HomeLayoutInitial());
        var result = await getAllProducts();
        result.fold((l) {
          emit(GetAllProductsErrorState(l));
        }, (r) {
          productsList = r.products ?? [];
          emit(GetAllProductsSuccessState(r));
        });
      }
    });
  }
}
