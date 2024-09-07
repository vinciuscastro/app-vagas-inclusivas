import 'package:app_kimberle/providers/feedbacks.dart';
import 'package:app_kimberle/providers/filter_provider.dart';
import 'package:app_kimberle/providers/jobs.dart';
import 'package:app_kimberle/screens/favorite_screen.dart';
import 'package:app_kimberle/screens/home_screen.dart';
import 'package:app_kimberle/screens/job_detail.dart';
import 'package:app_kimberle/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Jobs()),
        ChangeNotifierProvider(create: (context) => Feedbacks()),
        ChangeNotifierProvider(create: (context) => FilterProvider())
      ],
      child: MaterialApp(
        title: 'Kimberle - Vagas de Emprego',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A4673)),
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2A4673),
          primaryColorLight: const Color(0xFFD9E7FF),
          primaryColorDark: const Color(0xFF2A4673),
          scaffoldBackgroundColor: const Color(0xFF1E1E1E),
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 16, color: Color(0xFFD9E7FF)),
            labelSmall: TextStyle(fontSize: 14, color: Color(0xFFD9E7FF)),
            titleLarge: TextStyle(fontSize: 32, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
            titleMedium: TextStyle(fontSize: 24, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
            titleSmall: TextStyle(fontSize: 20, color: Color(0xFFD9E7FF), fontWeight: FontWeight.bold),
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Color(0xFFD9E7FF), size: 40),
            backgroundColor: Color(0xFF2A4673),
            titleTextStyle: TextStyle(color: Color(0xFFD9E7FF), fontSize: 32, fontWeight: FontWeight.bold),
          ),
        ),
        home: const HomeScreen(),
        routes: {
          AppRoutes.JOB_DETAIL: (ctx) => const JobDetail(),
          AppRoutes.FAVORITES: (ctx) => const FavoriteScreen(),

        }
      ),
    );
  }
}
