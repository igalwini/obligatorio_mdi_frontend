import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final Function(String) onSelect;
  final String selectedItem;

  const Sidebar({
    super.key,
    required this.onSelect,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    const List<String> items = ['Inicio', 'Perfil', 'Configuración'];

    return Container(
      width: 200,
      height: double.infinity,
      color: const Color(0xFFF8F9FA), // #f8f9fa
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: items.map((item) {
          final isActive = selectedItem == item;
          
          return GestureDetector(
            onTap: () => onSelect(item),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: isActive ? const Color(0xFF007BFF) : Colors.transparent, // #007BFF
              child: Text(
                item,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
} 