import 'package:flutter/material.dart';
import 'router.dart'; // استيراد ملف router.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'InvestMe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: _router, // استخدام GoRouter هنا
    );
  }
}