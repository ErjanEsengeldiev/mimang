import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mi_mang/core/constans/app_constans.dart';
import 'package:mi_mang/features/auth/presentation/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: AppConstans.apiKey,
      authDomain: AppConstans.authDomain,
      projectId: AppConstans.projectId,
      storageBucket: AppConstans.storageBucket,
      messagingSenderId: AppConstans.messagingSenderId,
      appId: AppConstans.appId,
      measurementId: AppConstans.measurementId,
    ),
  );

// Ideal time to initialize
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mimang',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const AuthPage(),
    );
  }
}
