import 'package:coding_challenge/screens/dashboard/dashboard_screen.dart';
import 'package:coding_challenge/screens/login/login_screen.dart';
import 'package:coding_challenge/services/singletons/api_service.dart';
import 'package:coding_challenge/services/singletons/auth_service.dart';
import 'package:coding_challenge/services/singletons/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;

  var storageService = StorageService();
  getIt.registerSingleton(storageService);

  var authService = AuthService(storage: storageService);
  await authService.initialize();
  getIt.registerSingleton(authService);

  getIt.registerSingleton(ApiService(authService: authService));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(65, 171, 158, 1),
        ).copyWith(primary: const Color.fromRGBO(65, 171, 158, 1)),
      ),
      home: GetIt.instance<AuthService>().isLoggedIn()
          ? DashboardScreen()
          : LoginScreen(),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
