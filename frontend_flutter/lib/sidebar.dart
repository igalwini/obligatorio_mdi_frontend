import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final Function(String) onSelect;

  const Sidebar({Key? key, required this.onSelect}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String activeItem = 'Inicio';
  final List<String> items = ['Inicio', 'Perfil', 'Configuración'];

  void handleClick(String item) {
    setState(() {
      activeItem = item;
    });
    widget.onSelect(item);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFF8F9FA), // #f8f9fa
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          final bool isActive = item == activeItem;
          return InkWell(
            onTap: () => handleClick(item),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: isActive ? const Color(0xFF007BFF) : Colors.transparent,
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
