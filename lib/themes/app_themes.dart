import 'package:flutter/material.dart';

class AppThemes {
  // =========================================================
  // 🌱 TEMA VERDE (PRINCIPAL)
  // =========================================================
  static final verde = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7A9544),
      brightness: Brightness.light,
    ).copyWith(
      surface: const Color(0xFFFFFFFF), // cards e containers
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    iconTheme: const IconThemeData(
      color: Color(0xFF7A9544),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
      ),
    ),
    cardTheme: const CardThemeData(
      color: Color(0xFFFFFFFF),
    ),
  );

  // =========================================================
  // 🔵 TEMA AZUL
  // =========================================================
  static final azul = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // 🎨 Paleta principal do app
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF547A96), // 🟢 cor principal
      brightness: Brightness.light,
    ).copyWith(
      primary: const Color(0xFF547A96), // 🟢 cor principal

      surface: const Color(0xFFFFFFFF), // 🧱 fundo de cards / containers
    ),

    scaffoldBackgroundColor: const Color(0xFFE0EEF9), // 🌑 fundo geral da tela

    iconTheme: const IconThemeData(
      // 🎯 ícones
      color: Color(0xFF547A96),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFF3A3E41), // ✍️ texto principal
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF4E5F6C), // ✍️ texto secundário
      ),
    ),

    cardTheme: const CardThemeData(
      // 🧱 cards
      color: Color(0xFFFFFFFF),
    ),
  );

  // =========================================================
  // 🔴 TEMA VERMELHO
  // =========================================================
  static final vermelho = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
    ),
  );

  // =========================================================
  // 🌙 TEMA ESCURO
  // =========================================================
  static final escuro = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // 🎨 Paleta principal do app
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7A9544), // 🟢 cor principal
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color(0xff3b3b3a), // 🟢 cor principal

      surface: const Color(0xFF1E1E1E), // 🧱 fundo de cards / containers
    ),

    scaffoldBackgroundColor: const Color(0xFF121212), // 🌑 fundo geral da tela

    iconTheme: const IconThemeData(
      // 🎯 ícones
      color: Color(0xFFE0E0E0),
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFFE0E0E0), // ✍️ texto principal
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFB0B0B0), // ✍️ texto secundário
      ),
    ),

    cardTheme: const CardThemeData(
      // 🧱 cards
      color: Color(0xFF1E1E1E),
    ),
  );
}