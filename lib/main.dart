import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unstage_app/pages/app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  _runInit();
  runApp(const MyApp());
}

void _runInit() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 한국어 로케일 초기화
  initializeDateFormatting('ko_KR', null);

  // 가로모드 방지
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unstage',
      theme: _themeData(),
      home: const App(),
    );
  }
}

ThemeData _themeData() {
  return ThemeData(
    fontFamily: 'Pretendard',
    scaffoldBackgroundColor: const Color(0xFFF7F7FB),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      scrolledUnderElevation: 0,
      backgroundColor: Color(0xFFF7F7FB),
      titleTextStyle: TextStyle(
        color: Color(0xFF292929),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
    ),

    colorScheme: const ColorScheme.light(

        onPrimary: Color(0xFF5F43FF), // 메인 컬러 1
        onSecondary: Color(0xFFEDEAFF), // 메인 컬러 2
        onTertiary: Color(0xFFE9F1FA), // 메인 컬러 3

        primary: Color(0xFF111111), // 폰트 컬러 1
        secondary: Color(0xFF505050), // 폰트 컬러 2
        tertiary: Color(0xFF767676), // 폰트 컬러 3

        error: Color(0xFFFF5D5D),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 20,
        color: Color(0xFF111111),
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        color: Color(0xFF111111),
        fontWeight: FontWeight.w600,
        height: 1.4,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF111111),
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Color(0xFF505050),
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: Color(0xFF767676),
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: Color(0xFF767676),
        fontWeight: FontWeight.w400,
        height: 1.4,
      ),
    ),

  );
}

