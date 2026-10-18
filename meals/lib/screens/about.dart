
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFEE6983),
                    Color(0xFF850E35),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF850E35)
                        .withValues(alpha: 0.18),
                    blurRadius: 15,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    size: 55,
                    color: Color(0xFFFCF5EE),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Blush & Berry Recipes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A little inspiration for every meal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFCF5EE),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const _AboutCard(
              icon: Icons.restaurant_rounded,
              title: 'Our Purpose',
              description:
                  'Blush & Berry Recipes helps you discover delicious '
                  'meals and find inspiration for your everyday cooking.',
            ),
            const _AboutCard(
              icon: Icons.menu_book_rounded,
              title: 'Explore Recipes',
              description:
                  'Browse different food categories, view recipe details, '
                  'and learn about each meal’s preparation time, '
                  'difficulty, and affordability.',
            ),
            const _AboutCard(
              icon: Icons.tune_rounded,
              title: 'Made for Your Preferences',
              description:
                  'Use the dietary filters to find meals that match your '
                  'preferences. Save your favorite recipes so you can '
                  'easily find them again.',
            ),
            Container(
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF4D9D0),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color(0xFFD9ABAB),
                  width: 1.3,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Color(0xFF850E35),
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Made with love and a little pink magic.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3A0519),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      elevation: 4,
      shadowColor: const Color(0xFF850E35).withValues(alpha: 0.10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(
          color: Color(0xFFF4D9D0),
          width: 1.3,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5E9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF850E35),
                size: 25,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF850E35),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xFF3A0519),
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
