import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharma_tech_driver/data/repository/Setting_Repo.dart';
import 'package:pharma_tech_driver/data/repository/auth_repo.dart';
import 'package:pharma_tech_driver/data/repository/myOrderRepo.dart';
import 'package:pharma_tech_driver/data/repository/products_Repo.dart';
import 'package:pharma_tech_driver/presentation/modules/auth/auth_view_model.dart';
import 'package:pharma_tech_driver/data/repository/categories_Repo.dart';
import 'package:pharma_tech_driver/data/repository/home_Repo.dart';
import 'package:pharma_tech_driver/presentation/modules/setting/settingViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'core/network_info.dart';
import 'data/app_urls/app_url.dart';
import 'data/datasource/locale/locale_data_source.dart';
import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/model/response/user_model.dart';
import 'data/repository/SaveUserData.dart';
import 'data/repository/orders_repo.dart';
import 'data/repository/setting_repository.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// Core
  getIt.registerLazySingleton(() => NetworkInfo(getIt()));
  getIt.registerLazySingleton(() => DioClient(AppURL.kBaseURL, getIt(),
      loggingInterceptor: getIt(), sharedPreferences: getIt()));

  /// Providers
  getIt.registerLazySingleton(() => AuthViewModel(saveUserData: getIt(), authRepo: getIt()));
  getIt.registerLazySingleton(() => SettingViewModel(settingRepo: getIt(), saveUserData: getIt(), productsRepo: getIt(),));
  getIt.registerLazySingleton(() => ProductProvider());

  /// Repository
  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));
  getIt.registerLazySingleton(() => AuthRepo(dioClient: getIt(), saveUserData: getIt()));
  getIt.registerLazySingleton(() => HomeRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => CategoriesRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => ProductsRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => SettingRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => MyOrdersRepo(dioClient: getIt()));
  getIt.registerLazySingleton(() => OrdersRepo(saveUserData: getIt(), dioClient: getIt()));
  getIt.registerLazySingleton(() => SettingRepository());
//  getIt.registerLazySingleton(() => SaveUserData(sharedPreferences: getIt(), dioClient: getIt()));

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => LoggingInterceptor());
  getIt.registerLazySingleton(() => UserModel());
  getIt.registerLazySingleton(() => Connectivity());
}
