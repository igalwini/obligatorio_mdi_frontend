import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Row(
        children: [
          _NavBarItem(
            label: 'Home',
            route: '/',
          ),
          const SizedBox(width: 16.0),
          _NavBarItem(
            label: 'Profile',
            route: '/profile',
          ),
          const SizedBox(width: 16.0),
          _NavBarItem(
            label: 'Settings',
            route: '/settings',
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String label;
  final String route;

  const _NavBarItem({
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(route),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Text(label),
      ),
    );
  }
}