import 'package:flutter/material.dart';
import 'pages/app_home.dart';
import 'pages/app_perfil.dart';
import 'pages/app_automacao.dart';
import 'pages/app_irrigacao.dart';

// IMPORTA OS TEMAS
import 'themes/app_themes.dart';
import 'themes/theme_controller.dart';

// INSTÂNCIA GLOBAL
final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return MaterialApp(
          title: "Exemplo StateFulWidget",
          debugShowCheckedModeBanner: false,

          // AGORA O TEMA É DINÂMICO
          theme: themeController.theme,

          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/perfil': (context) => const Perfil(),
            '/automacao': (context) => const Automacao(),
            '/irrigacao': (context) => const Irrigacao(),
          },
        );
      },
    );
  }
}
