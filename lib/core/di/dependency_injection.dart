import 'package:get_it/get_it.dart';
import 'package:new_e_commerce_app/core/helpers/storage_helper.dart';
import 'package:new_e_commerce_app/core/networking/dio_helper.dart';
import 'package:new_e_commerce_app/core/repos/auth_repo/auth_repo.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/repo/cart_repo.dart';
import 'package:new_e_commerce_app/features/cart_screen/logic/cart_cubit.dart';
import 'package:new_e_commerce_app/features/home_screen/data/repo/home_repo.dart';
import 'package:new_e_commerce_app/features/home_screen/logic/categories_cubit.dart';

import '../../features/home_screen/logic/product_cubit.dart';
import '../cubits/auth_cubit/auth_cubit.dart';


final getIt = GetIt.instance;
Future<void> setupGetIt() async {
  final DioHelper dio = DioHelper();
  /// Dio & ApiService
  getIt.registerSingleton<DioHelper>(dio);
  /// Repos
  getIt.registerLazySingleton(()=> AuthRepo(getIt<DioHelper>()));
  getIt.registerLazySingleton(()=> HomeRepo(getIt<DioHelper>()));
  getIt.registerLazySingleton(()=> CartRepo(getIt<DioHelper>()));
  ///Cubits
  getIt.registerFactory(()=> AuthCubit(getIt<AuthRepo>()));
  getIt.registerFactory(()=> ProductCubit(getIt<HomeRepo>()));
  getIt.registerFactory(()=> CategoriesCubit(getIt<HomeRepo>()));
  getIt.registerFactory(()=> CartCubit(getIt<CartRepo>()));
  /// Storage
  getIt.registerLazySingleton(()=> StorageHelper());
}