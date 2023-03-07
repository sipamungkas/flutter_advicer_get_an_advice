import 'package:advicer/application/pages/advice/advice_page.dart';
import 'package:advicer/theme.dart';
import 'package:advicer/application/core/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        title: 'Question List',
        home: const AdvicePage(),
      );
    });
  }
}
