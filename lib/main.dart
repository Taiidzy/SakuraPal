import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SakuraPal',
      theme: ThemeData(
        primaryColor: Color(0xFFE87EA1), // Зелёный цвет акцентов
        scaffoldBackgroundColor: Color(0xFFF5E9DC), // Бежевый фон
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFE87EA1),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.brown[700]), // Коричневый для текста
          bodyMedium: TextStyle(color: Colors.brown[600]),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFFE87EA1), // Кнопки в розовом стиле
          textTheme: ButtonTextTheme.primary,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF78C850)),
      ),
      home: SplashScreen(),
    );
  }
}
