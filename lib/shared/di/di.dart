import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/shared/network/local/cache_helper.dart';
import 'package:softagi/shared/network/remote/dio_helper.dart';

GetIt di = GetIt.I..allowReassignment = true;

Future init() async
{
  final sp = await SharedPreferences.getInstance();

  di.registerLazySingleton<SharedPreferences>(
        () => sp,
  );

  di.registerLazySingleton<CacheHelper>(
        () => CacheImpl(
      di<SharedPreferences>(),
    ),
  );

  di.registerLazySingleton<DioHelper>(
        () => DioImpl(),
  );
}