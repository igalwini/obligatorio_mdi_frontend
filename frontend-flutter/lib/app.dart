import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/nav_bar.dart';
import '../models/user_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(),
      child: MaterialApp(
        title: 'Flutter Web App',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AppContainer(),
          '/profile': (context) => const ProfileScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtener la ruta actual si es necesario, por ejemplo:
    // final currentRoute = ModalRoute.of(context)?.settings.name;
    return Scaffold(
      body: Column(
        children: [
          const NavBar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: const HomeScreen(),
            ),
          ),
        ],
      ),
    );
  }
}