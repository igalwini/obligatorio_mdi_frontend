import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final ValueChanged<String> onSelect;

  const Sidebar({Key? key, required this.onSelect}) : super(key: key);

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String _activeItem = 'Inicio';

  final List<String> _items = ['Inicio', 'Perfil', 'Configuración'];

  void _handleTap(String item) {
    setState(() {
      _activeItem = item;
    });
    widget.onSelect(item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      color: const Color(0xFFF8F9FA),
      child: Column(
        children: _items.map((item) {
          final bool isActive = item == _activeItem;
          return InkWell(
            onTap: () => _handleTap(item),
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