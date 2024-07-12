import 'package:dartz/dartz.dart';

import '../../../../core/eror/failuers.dart';
import '../../data/models/products_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, ProductsModel>> getAllProducts();
}
