import 'package:get_it/get_it.dart';
import 'package:the_fin_news/utils/assets/app_string.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AppString>(() => AppString());
}
