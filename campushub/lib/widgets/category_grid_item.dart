import 'package:flutter/material.dart';

import 'package:campus_hub/models/activity_category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final ActivityCategory category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: onSelectCategory,
        borderRadius: BorderRadius.circular(24),
        splashColor: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.2),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: category.color.withValues(alpha: 0.13),
            border: Border.all(
              color: category.color.withValues(alpha: 0.55),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: category.color.withValues(alpha: 0.12),
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
                Icon(
                  _iconForCategory(category.title),
                  color: category.color,
                  size: 30,
                ),
                const Spacer(),
                Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
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

  IconData _iconForCategory(String title) {
    return switch (title.toLowerCase()) {
      'technology' => Icons.computer_rounded,
      'research' => Icons.science_rounded,
      'competition' => Icons.emoji_events_rounded,
      'career' => Icons.work_rounded,
      'leadership' => Icons.groups_rounded,
      'community' || 'community service' => Icons.volunteer_activism_rounded,
      _ => Icons.event_rounded,
    };
  }
}