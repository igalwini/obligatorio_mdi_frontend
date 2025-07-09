import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Usar ModalRoute para obtener la ruta actual de forma compatible
    final location = ModalRoute.of(context)?.settings.name ?? '/';

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Row(
        children: [
          _NavLink(label: 'Home', route: '/', active: location == '/'),
          const SizedBox(width: 16),
          _NavLink(label: 'Profile', route: '/profile', active: location == '/profile'),
          const SizedBox(width: 16),
          _NavLink(label: 'Settings', route: '/settings', active: location == '/settings'),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final String route;
  final bool active;

  const _NavLink({required this.label, required this.route, required this.active});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Container(
        decoration: BoxDecoration(
          color: active ? const Color(0xFFE3EAFE) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          label,
          style: TextStyle(
            color: active ? const Color(0xFF1976D2) : const Color(0xFF333333),
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
