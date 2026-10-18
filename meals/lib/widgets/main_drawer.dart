import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    const darkPink = Color(0xFF850E35);
    const pink = Color(0xFFEE6983);

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 28,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFC4C4),
                    Color(0xFFF4D9D0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: pink,
                  width: 1.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: darkPink.withValues(alpha: 0.12),
                    blurRadius: 12,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.restaurant_menu_rounded,
                    size: 52,
                    color: darkPink,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Blush & Berry',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Your little recipe corner',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _DrawerItem(
              icon: Icons.restaurant_rounded,
              title: 'Categories',
              onTap: () => onSelectScreen('meals'),
            ),
            _DrawerItem(
              icon: Icons.favorite_rounded,
              title: 'Favorites',
              onTap: () => onSelectScreen('favorites'),
            ),
            _DrawerItem(
              icon: Icons.tune_rounded,
              title: 'Dietary Filters',
              onTap: () => onSelectScreen('filters'),
            ),
            _DrawerItem(
              icon: Icons.info_rounded,
              title: 'About Us',
              onTap: () => onSelectScreen('about'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Cook something lovely. ♡',
                style: TextStyle(
                  color: darkPink.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(17),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(
                color: const Color(0xFFF4D9D0),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF850E35),
                  size: 23,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF3A0519),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: Color(0xFFC75B7A),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}