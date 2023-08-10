import 'package:clipr/otp_auth_page.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFd45113),
          background: Color(0xfff8dda4),
        ),
        useMaterial3: true,
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFd45113),
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: GoogleFonts.oswaldTextTheme().copyWith(
          displayMedium: GoogleFonts.oswald(
            color: const Color(0xFFd45113),
            fontSize: 20,
          ),
          labelLarge: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          labelSmall: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          labelMedium: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: GoogleFonts.oswald(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const LoginPage(),
      routes: {
        '/otp': (context) => OTPPage(), // Named route for the destination page
      },
    );
  }
}
