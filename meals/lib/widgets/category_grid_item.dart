import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final void Function() onSelectCategory;

  static const List<Color> _categoryColors = [
    Color(0xFFFFC4C4),
    Color(0xFFF4D9D0),
    Color(0xFFEF88AD),
    Color(0xFFD9ABAB),
    Color(0xFFFFDDE5),
    Color(0xFFF8C8DC),
    Color(0xFFFFE5D9),
    Color(0xFFEEC6D3),
    Color(0xFFFFD1DC),
    Color(0xFFF9DDE2),
  ];

  @override
  Widget build(BuildContext context) {
    final categoryNumber =
        int.tryParse(category.id.replaceAll('c', '')) ?? 1;

    final tileColor =
        _categoryColors[(categoryNumber - 1) % _categoryColors.length];

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onSelectCategory,
        borderRadius: BorderRadius.circular(24),
        splashColor: const Color(0xFFEE6983).withValues(alpha: 0.2),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                tileColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: const Color(0xFFC75B7A).withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF850E35).withValues(alpha: 0.10),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.favorite_rounded,
                  color: Color(0xFF850E35),
                  size: 23,
                ),
                const SizedBox(height: 8),
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color(0xFF3A0519),
                        fontWeight: FontWeight.w800,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}