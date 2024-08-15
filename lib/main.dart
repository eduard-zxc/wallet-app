import 'package:flutter/material.dart';
import 'package:wallet_app/firebase_options.dart';
import 'package:wallet_app/pages/home.dart';
import 'package:wallet_app/pages/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const AuthGate(),
        '/home': (context) => const Home(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
