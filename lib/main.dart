import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lapor_book_bk/firebase_options.dart';
import 'package:lapor_book_bk/pages/LoginPage.dart';
import 'package:lapor_book_bk/pages/SplashPage.dart';
import 'package:lapor_book_bk/pages/RegisterPage.dart';
import 'package:lapor_book_bk/pages/dashboard/DashboardPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Lapor Book',
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashPage(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/dashboard': (context) => const DashboardPage(),
      // Tambahkan route lain jika ada
    },
    // Hapus onGenerateRoute jika tidak diperlukan
    // onGenerateRoute: (settings) {...},
  ));
}
