import 'package:dartz/dartz.dart';

import '../../../../core/eror/failuers.dart';
import '../../data/models/products_model.dart';
import '../repositories/home_repo.dart';

class GetAllProducts {
  HomeRepo homeRepo;
  GetAllProducts(this.homeRepo);
  Future<Either<Failures, ProductsModel>> call() => homeRepo.getAllProducts();
}
