import 'package:get_it/get_it.dart';
import '../../features/Home Layout/data/datasources/remote/remote_ds_impl.dart';
import '../../features/Home Layout/data/repositories/home_repo_impl.dart';
import '../../features/Home Layout/domain/usecases/get_all_products.dart';
import '../../features/Home Layout/presentation/bloc/home_layout_bloc.dart';
import '../api/api_manager.dart';

final GetIt sl = GetIt.instance;
void init() {
  // Core
  sl.registerLazySingleton(() => ApiManager());

  // Data sources
  sl.registerLazySingleton<HomeRemoteDsImple>(
      () => HomeRemoteDsImple(sl<ApiManager>()));

  // Repository
  sl.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(sl<HomeRemoteDsImple>()));

  // Use Cases
  sl.registerLazySingleton(() => GetAllProducts(sl<HomeRepoImpl>()));

  // Bloc
  sl.registerFactory(() => HomeLayoutBloc(sl<GetAllProducts>()));
}
