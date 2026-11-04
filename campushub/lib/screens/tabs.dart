import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campus_hub/providers/favorites_provider.dart';
import 'package:campus_hub/screens/categories_screen.dart';
import 'package:campus_hub/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final favoriteCount = context.watch<FavoritesProvider>().favorites.length;
    final activePage = _selectedPageIndex == 0
        ? const CategoriesScreen()
        : const FavoritesScreen();
    final title = _selectedPageIndex == 0 ? 'CampusHub' : 'Your Favorites';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: activePage,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPageIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedPageIndex = index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Categories',
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_rounded),
            label: favoriteCount == 0 ? 'Favorites' : 'Favorites ($favoriteCount)',
          ),
        ],
      ),
    );
  }
}
