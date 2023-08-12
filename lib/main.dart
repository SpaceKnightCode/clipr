import 'package:clipr/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            toolbarHeight: 70,
            centerTitle: true,
            foregroundColor: Colors.white),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: GoogleFonts.oswaldTextTheme().copyWith(
          titleMedium: GoogleFonts.oswald(
            fontSize: 18,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 20,
          ),
          titleSmall: GoogleFonts.oswald(
            fontSize: 15,
          ),
          displayMedium: GoogleFonts.oswald(
            fontSize: 20,
          ),
          displaySmall: GoogleFonts.oswald(
            fontFeatures: [],
            fontSize: 10,
          ),
          displayLarge: GoogleFonts.oswald(
            fontFeatures: [],
            fontSize: 35,
          ),
          labelLarge: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.oswald(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.oswald(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.oswald(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            toolbarHeight: 70,
            centerTitle: true,
            foregroundColor: Colors.white),
        buttonTheme: const ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: GoogleFonts.oswaldTextTheme().copyWith(
          titleMedium: GoogleFonts.oswald(
            fontSize: 18,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 20,
          ),
          titleSmall: GoogleFonts.oswald(
            fontSize: 15,
          ),
          displayMedium: GoogleFonts.oswald(
            fontSize: 20,
          ),
          displaySmall: GoogleFonts.oswald(
            fontFeatures: [],
            fontSize: 10,
          ),
          displayLarge: GoogleFonts.oswald(
            fontFeatures: [],
            fontSize: 35,
          ),
          labelLarge: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.oswald(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.oswald(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.oswald(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: GoogleFonts.oswald(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Homepage();
          } else {
            return LoginPage();
          }
        },
      ),
      routes: {
        '/home': (context) => Homepage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
