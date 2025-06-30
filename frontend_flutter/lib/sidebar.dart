import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final Function(String) onSelect;

  const Sidebar({super.key, required this.onSelect});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String _activeItem = 'Inicio';

  final List<String> _items = ['Inicio', 'Perfil', 'Configuración'];

  void _handleItemClick(String item) {
    setState(() {
      _activeItem = item;
    });
    widget.onSelect(item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: const Color(0xFFf8f9fa),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _items.map((item) {
          final isActive = _activeItem == item;
          
          return InkWell(
            onTap: () => _handleItemClick(item),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: isActive ? const Color(0xFF007BFF) : Colors.transparent,
              child: Text(
                item,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}