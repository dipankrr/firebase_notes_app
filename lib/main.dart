import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notes_app/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(apiKey: "AIzaSyC8qeFl8tk1cLacVyAFUktf93MGEIokTd4",
        authDomain: "note-app-a4fe8.firebaseapp.com",
        projectId: "note-app-a4fe8",
        storageBucket: "note-app-a4fe8.firebasestorage.app",
        messagingSenderId: "921624388283",
        appId: "1:921624388283:web:12b6f953881251880aff9e",
        measurementId: "G-N7VZ2L5TFV"));
  }
  else { await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        fontFamily: 'DMSans',
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

