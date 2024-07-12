import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/api_manager.dart';
import '../../../../../core/api/end_points.dart';
import '../../../../../core/eror/failuers.dart';
import '../../models/products_model.dart';
import 'remote_ds.dart';

class HomeRemoteDsImple implements HomeRemoteDs {
  ApiManager apiManager;

  HomeRemoteDsImple(this.apiManager);

  @override
  Future<Either<Failures, ProductsModel>> getAllProducts() async {
    try {
      Response response = await apiManager.getData(EndPoints.getAllProducts);

      ProductsModel productsModel = ProductsModel.fromJson(response.data);
      return Right(productsModel);
    } catch (e) {
      return Left(RemoteFailure(message: e.toString()));
    }
  }
}
