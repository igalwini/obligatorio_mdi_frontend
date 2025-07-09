import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final location = ModalRoute.of(context)?.settings.name ?? '/';
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          _NavLink(title: "Home", path: "/", active: location == "/"),
          const SizedBox(width: 24),
          _NavLink(title: "Profile", path: "/profile", active: location == "/profile"),
          const SizedBox(width: 24),
          _NavLink(title: "Settings", path: "/settings", active: location == "/settings"),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String path;
  final bool active;
  const _NavLink({required this.title, required this.path, required this.active});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(path),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFE3EAFE) : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active ? const Color(0xFF1976D2) : const Color(0xFF333333),
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}