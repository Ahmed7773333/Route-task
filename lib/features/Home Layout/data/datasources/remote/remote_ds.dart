import 'package:dartz/dartz.dart';
import '../../../../../core/eror/failuers.dart';
import '../../models/products_model.dart';

abstract class HomeRemoteDs {
  Future<Either<Failures, ProductsModel>> getAllProducts();
}
