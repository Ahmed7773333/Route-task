// ignore_for_file: must_be_immutable

part of 'home_layout_bloc.dart';

@immutable
class HomeLayoutState {}

class HomeLayoutInitial extends HomeLayoutState {
  HomeLayoutInitial() : super();
}

class ChangePageState extends HomeLayoutState {}

class GetAllProductsSuccessState extends HomeLayoutState {
  ProductsModel wishListProductModel;
  GetAllProductsSuccessState(this.wishListProductModel);
}

class GetAllProductsErrorState extends HomeLayoutState {
  Failures error;
  GetAllProductsErrorState(this.error);
}
