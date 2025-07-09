import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.path;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE0E0E0), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Row(
        children: [
          _NavButton(
            text: 'Home',
            path: '/',
            isActive: currentPath == '/',
            onTap: () => context.go('/'),
          ),
          const SizedBox(width: 32),
          _NavButton(
            text: 'Profile',
            path: '/profile',
            isActive: currentPath == '/profile',
            onTap: () => context.go('/profile'),
          ),
          const SizedBox(width: 32),
          _NavButton(
            text: 'Settings',
            path: '/settings',
            isActive: currentPath == '/settings',
            onTap: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final String text;
  final String path;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.text,
    required this.path,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? const Color(0xFFE3EAFE)
                : _isHovered
                    ? const Color(0xFFF0F4FF)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.isActive ? const Color(0xFF1976D2) : const Color(0xFF333333),
              fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
              fontSize: 17.6,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
