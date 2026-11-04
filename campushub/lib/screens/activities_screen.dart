import 'package:flutter/material.dart';

import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/screens/activity_detail_screen.dart';
import 'package:campus_hub/widgets/activity_card.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({
    super.key,
    required this.title,
    required this.activities,
  });

  final String title;
  final List<Activity> activities;

  void _openActivity(BuildContext context, Activity activity) {
    Navigator.of(context).push(
      PageRouteBuilder<void>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ActivityDetailScreen(activity: activity),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: activities.isEmpty
          ? const Center(
              child: Text('No activities available in this category.'),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                final columns = constraints.maxWidth >= 900
                    ? 3
                    : constraints.maxWidth >= 600
                        ? 2
                        : 1;
                if (columns == 1) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: activities.length,
                    itemBuilder: (context, index) => ActivityCard(
                      activity: activities[index],
                      onSelect: () =>
                          _openActivity(context, activities[index]),
                    ),
                  );
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: activities.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, index) => ActivityCard(
                    activity: activities[index],
                    onSelect: () => _openActivity(context, activities[index]),
                  ),
                );
              },
            ),
    );
  }
}
