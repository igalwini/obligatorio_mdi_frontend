import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'user_provider.dart';
import 'home.dart';
import 'profile.dart';
import 'settings.dart';
import 'navbar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomeView()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfileView()),
        GoRoute(
          path: '/settings',
          builder: (context, state) {
            // Para pasar datos del profile a settings (via estado extra)
            final user = state.extra as User?;
            return SettingsView(userFromProfile: user);
          },
        ),
      ],
    );

    return MaterialApp.router(
      title: 'Flutter SPA Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F8FA),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      routerConfig: _router,
    );
  }
}