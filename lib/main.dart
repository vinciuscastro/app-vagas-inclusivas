import 'package:app_kimberle/providers/feedbacks.dart';
import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/providers/settings_provider.dart';

import 'package:app_kimberle/screens/favorite_screen.dart';
import 'package:app_kimberle/screens/home_screen.dart';
import 'package:app_kimberle/screens/job_detail.dart';
import 'package:app_kimberle/screens/settings_screen.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Jobs()),
      ChangeNotifierProvider(create: (context) => Feedbacks()),
      ChangeNotifierProvider(create: (context) => FilterProvider()),
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
    ],
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final corPrincipalDark = const Color(0xFF2A4673);
  final corSecundariaDark = const Color(0xFFD9E7FF);
  final corTextoDark = const Color(0xFFD9E7FF);
  final corPrincipalLight = const Color(0xFF547BA7);
  final corSecundariaLight = const Color(0xFFD9E7FF);
  final corTextoLight = const Color(0xFF2A4673);

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) =>
      MaterialApp(
        title: 'Kimberle - Vagas de Emprego',
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A4673)),
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2A4673),
          primaryColorLight: const Color(0xFFD9E7FF),
          primaryColorDark: Colors.white,
          scaffoldBackgroundColor: const Color(0xFF1E1E1E),
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 16, color: Color(0xFFD9E7FF)),
            labelSmall: TextStyle(fontSize: 14, color: Color(0xFFD9E7FF)),
            titleLarge: TextStyle(fontSize: 32, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 24, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 20, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Color(0xFFD9E7FF)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD9E7FF)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFD9E7FF)),
            ),
          ),
          fontFamily: 'OpenSans',
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            toolbarHeight: 90,
            iconTheme: IconThemeData(color: Color(0xFFD9E7FF), size: 40),
            backgroundColor: Color(0xFF2A4673),
            titleTextStyle: TextStyle(color: Color(0xFFD9E7FF), fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),

        theme: ThemeData(
          primaryColor: corPrincipalLight,
          primaryColorLight: corSecundariaLight,
          primaryColorDark: corTextoLight,
          scaffoldBackgroundColor: const Color(0xFFF7F7F7),
          textTheme: TextTheme(
            bodySmall: TextStyle(fontSize: 16, color: corTextoLight),
            labelSmall: TextStyle(fontSize: 14, color: corTextoLight),
            titleLarge: TextStyle(fontSize: 32, color: corTextoLight, fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 24, color: corTextoLight, fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 20, color: corTextoLight, fontWeight: FontWeight.bold),
          ),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: corTextoLight),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: corSecundariaLight),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: corSecundariaLight),
            ),
          ),
          iconTheme: IconThemeData(color: corTextoLight),
          fontFamily: 'OpenSans',
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            toolbarHeight: 90,
            iconTheme: IconThemeData(color: corTextoLight, size: 40),
            backgroundColor: corPrincipalLight,
            titleTextStyle: TextStyle(color: corTextoLight, fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        themeMode: settingsProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: const HomeScreen(),
        routes: {
          AppRoutes.JOB_DETAIL: (ctx) => const JobDetail(),
          AppRoutes.FAVORITES: (ctx) => const FavoriteScreen(),
          AppRoutes.SETTINGS: (ctx) => const SettingsScreen(),

        }
      ),
    );
  }
}
