import 'package:flutter/material.dart';

class AppNavegacao extends StatelessWidget {
  final int currentIndex;

  const AppNavegacao({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/irrigacao');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/automacao');
        } else if (index == 3) {
          Navigator.pushReplacementNamed(context, '/perfil');
        }
      },
      backgroundColor: Theme.of(context).colorScheme.primary,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.water_drop),
          label: "Irrigação",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.memory),
          label: "Automação",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Perfil",
        ),
      ],
    );
  }
}
