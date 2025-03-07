import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novel_starter/screens/main_screen.dart';

void main() async {
  await dotenv.load(fileName: 'assets/.env');
  await initializeFirebase();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '소설 공유 사이트',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

Future<void> initializeFirebase() async {
  FirebaseApp app = await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator("10.0.2.2", 9099);
  FirebaseFirestore.instance.useFirestoreEmulator("10.0.2.2", 8080);
}
