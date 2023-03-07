import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:videogame_rater/auth_controller.dart';
import 'package:videogame_rater/screens/credit_screen.dart';
import 'package:videogame_rater/screens/welcome_page.dart';
import 'package:videogame_rater/screens/all_games_screen.dart';
import 'package:videogame_rater/screens/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Video game rater',
        // Aqui indicamos las rutas a las que debe dirigir nuestro menu navegable lateral
        initialRoute: "/",
        routes: {
          "/": (context) => const MyHomePage(),
          "/videojuegos": (context) => const GamesScreen(),
          "/creditos": (context) => const CreditScreen()
        },
        // Aqui indicamos el tema, para que sea algo más agradable
        theme: ThemeData(
            primarySwatch: Colors.indigo, brightness: Brightness.light));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const LoginPage();
  }
}
