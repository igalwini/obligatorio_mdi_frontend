import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'home.dart';
import 'profile.dart';
import 'settings.dart';
import 'nav_bar.dart';
import 'user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter(
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: Column(
                children: [
                  const NavBar(),
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF7F8FA),
                      padding: const EdgeInsets.all(32),
                      child: child,
                    ),
                  ),
                ],
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
            ),
            GoRoute(
              path: '/settings',
              builder: (context, state) {
                final user = state.extra as User?;
                return SettingsPage(userFromProfile: user);
              },
            ),
          ],
        ),
      ],
    );

    return ChangeNotifierProvider(
      create: (_) => UserModel(),
      child: MaterialApp.router(
        title: 'Flutter SPA',
        routerConfig: router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
