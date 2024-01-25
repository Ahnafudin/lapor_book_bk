import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lapor_book_bk/firebase_options.dart';
import 'package:lapor_book_bk/pages/AddFormPage.dart';
import 'package:lapor_book_bk/pages/DetailPage.dart';
import 'package:lapor_book_bk/pages/LoginPage.dart';
import 'package:lapor_book_bk/pages/RegisterPage.dart';
import 'package:lapor_book_bk/pages/SignalPage.dart';
import 'package:lapor_book_bk/pages/SplashPage.dart';
import 'package:lapor_book_bk/pages/dashboard/DashboardPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Book',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/add': (context) => const AddFormPage(),
        '/detail': (context) => const DetailPage(),
        '/signal': (context) => const SignalPage(),
      },
    );
  }
}
