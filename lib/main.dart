import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:the_fin_news/services/dependency_services.dart';
import 'package:the_fin_news/utils/assets/app_colors.dart';
import 'package:the_fin_news/view/SplashScreen/splash_screen.dart';
import 'package:the_fin_news/viewModel/course_provider.dart';
import 'package:the_fin_news/viewModel/home_provider.dart';
import 'package:the_fin_news/viewModel/live_news_provider.dart';
import 'package:the_fin_news/viewModel/merketdata_provider.dart';
import 'package:the_fin_news/viewModel/recently_courses_provider.dart';
import 'package:the_fin_news/viewModel/reports_provider.dart';
import 'package:the_fin_news/viewModel/screen_route_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// Set the status bar color globally
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryColor, // Set the desired color
    statusBarIconBrightness: Brightness.light, // Light or dark icons
  ));

  /// set dependency injection
  setupServiceLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ScreenRouteProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => LiveNewsProvider()),
        ChangeNotifierProvider(create: (context) => RecentlyCoursesProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => MerketdataProvider()),
        ChangeNotifierProvider(create: (context) => ReportsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Fin News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
