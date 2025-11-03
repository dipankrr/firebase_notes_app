import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_notes_app/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://oopkltlrlnlapqdfjemy.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9vcGtsdGxybG5sYXBxZGZqZW15Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIxODc0MTAsImV4cCI6MjA3Nzc2MzQxMH0.8bS4uCkY1axCsYYJ4oAxlmdC4d10Rdm461xgzYkQCDQ',
  );

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

