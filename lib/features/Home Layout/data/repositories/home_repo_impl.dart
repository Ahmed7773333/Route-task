import 'package:dartz/dartz.dart';
import '../../../../core/eror/failuers.dart';
import '../../domain/repositories/home_repo.dart';
import '../datasources/remote/remote_ds_impl.dart';
import '../models/products_model.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDsImple homeRemoteDsImple;
  HomeRepoImpl(this.homeRemoteDsImple);

  @override
  Future<Either<Failures, ProductsModel>> getAllProducts() {
    return homeRemoteDsImple.getAllProducts();
  }
}
