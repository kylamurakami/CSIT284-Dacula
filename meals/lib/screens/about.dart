import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const darkPink = Color(0xFF850E35);
    const cream = Color(0xFFFCF5EE);
    const pink = Color(0xFFEE6983);

    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(26),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFC4C4),
                    Color(0xFFF4D9D0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: pink,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: darkPink.withValues(alpha: 0.12),
                    blurRadius: 16,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 43,
                    backgroundColor: cream,
                    child: Icon(
                      Icons.restaurant_menu_rounded,
                      size: 45,
                      color: darkPink,
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    'Blush & Berry Recipes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A little inspiration for every meal.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkPink,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _AboutCard(
              icon: Icons.favorite_rounded,
              title: 'Our Purpose',
              description:
                  'Discover recipes, explore different food categories, '
                  'and save your favorite meals for later.',
            ),
            const SizedBox(height: 14),
            _AboutCard(
              icon: Icons.menu_book_rounded,
              title: 'Explore Recipes',
              description:
                  'View ingredients, follow cooking steps, and check '
                  'the preparation time and difficulty of each meal.',
            ),
            const SizedBox(height: 14),
            _AboutCard(
              icon: Icons.tune_rounded,
              title: 'Made for Your Preferences',
              description:
                  'Use dietary filters to find meals that match your '
                  'gluten-free, lactose-free, vegetarian, or vegan preferences.',
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5E9),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: const Color(0xFFD9ABAB),
                ),
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.auto_awesome_rounded,
                    color: darkPink,
                    size: 28,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Made with love and a little pink magic.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: darkPink,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFFF4D9D0),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF850E35).withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE5E9),
              borderRadius: BorderRadius.circular(15),
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
                    fontWeight: FontWeight.w800,
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
    );
  }
}