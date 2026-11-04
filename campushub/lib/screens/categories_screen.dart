import 'package:flutter/material.dart';

import 'package:campus_hub/data/dummy_data.dart';
import 'package:campus_hub/models/activity_category.dart';
import 'package:campus_hub/screens/activities_screen.dart';
import 'package:campus_hub/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, ActivityCategory category) {
    final activities = dummyActivities
        .where((activity) => activity.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => ActivitiesScreen(
          title: category.title,
          activities: activities,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 600
                ? 3
                : 2;
        const categories = availableCategories;
        return GridView.builder(
          padding: EdgeInsets.all(constraints.maxWidth < 400 ? 16 : 24),
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            childAspectRatio: constraints.maxWidth < 400 ? 1.15 : 1.35,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryGridItem(
              category: category,
              onSelectCategory: () => _selectCategory(context, category),
            );
          },
        );
      },
    );
  }
}
