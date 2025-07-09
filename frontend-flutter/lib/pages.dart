import 'package:flutter/material.dart';
import 'custom_button.dart';

class User {
  String name;
  String email;
  User({required this.name, required this.email});
}

class UserProvider extends InheritedWidget {
  final User user;
  final void Function(User) setUser;

  const UserProvider({
    Key? key,
    required this.user,
    required this.setUser,
    required Widget child,
  }) : super(key: key, child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  @override
  bool updateShouldNotify(UserProvider oldWidget) => user != oldWidget.user;
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Welcome to the Home page!', style: TextStyle(fontSize: 20)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider.of(context)!;
    final user = userProvider.user;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Name: ${user.name}', style: TextStyle(fontSize: 18)),
        Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
        SizedBox(height: 16),
        CustomButton(
          text: 'Edit in Settings',
          onPressed: () {
            print('Botón presionado');
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    final user = UserProvider.of(context)!.user;
    _nameController = TextEditingController(text: user.name);
    _emailController = TextEditingController(text: user.email);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = UserProvider.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 24),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 24),
          CustomButton(
            text: 'Save',
            onPressed: () {
              userProvider.setUser(User(
                name: _nameController.text,
                email: _emailController.text,
              ));
              print('Botón presionado');
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTab;
  const NavBar({Key? key, required this.selectedIndex, required this.onTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTab,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
