import 'package:flutter/material.dart';
import 'horse_list_screen.dart';
import 'barn_list_screen.dart';
import 'owners_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HorseListScreen(),
    BarnListScreen(),
    OwnerListScreen(),
    Center(child: Text('Settings (soon)')),
  ];

  static const List<String> _titles = [
    'Horses',
    'Barns',
    'Owners',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int idx) {
          setState(() => _selectedIndex = idx);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pets),
            label: 'Horses',
          ),
          NavigationDestination(
            icon: Icon(Icons.home_work),
            label: 'Barns',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Owners',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
// This code defines a HomeScreen widget for a Flutter application.
// It includes a bottom navigation bar with four destinations: Horses, Barns, Owners, and Settings.
// Each destination displays a placeholder text when selected.
// The selected index is managed by the _selectedIndex state variable, and the screen updates when a new destination is selected.
// The app bar displays the title corresponding to the selected destination.
// This structure allows for easy expansion in the future, where each section can be developed further to include lists, search functionality, and other features as needed.
// The use of a StatefulWidget allows for dynamic updates to the UI based on user interactions with the navigation bar.