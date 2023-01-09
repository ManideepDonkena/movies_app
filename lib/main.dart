import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:movies_app/pages/auth_page.dart';
import 'firebase_options.dart';
import 'login_signup/src/welcomePage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   return const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: AuthPage(),
    //   );

    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.abhayaLibreTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.abrilFatface(textStyle: textTheme.bodyText1),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
