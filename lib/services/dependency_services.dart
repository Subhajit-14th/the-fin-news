import 'package:get_it/get_it.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';
import 'package:the_fin_news/viewModel/screen_route_provider.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<ScreenRouteProvider>(() => ScreenRouteProvider());
  getIt.registerLazySingleton<LiveNewsProvider>(() => LiveNewsProvider());
}
