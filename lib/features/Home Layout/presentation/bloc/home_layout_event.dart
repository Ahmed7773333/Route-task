// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'home_layout_bloc.dart';

abstract class HomeLayoutEvent extends Equatable {
  const HomeLayoutEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends HomeLayoutEvent {
  int index;
  ChangePageEvent({
    required this.index,
  });
}

class GetAllProductsEvent extends HomeLayoutEvent {}
