import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campus_hub/providers/favorites_provider.dart';
import 'package:campus_hub/screens/activity_detail_screen.dart';
import 'package:campus_hub/widgets/activity_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favorites, child) {
        final activities = favorites.favorites;
        if (activities.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    size: 64,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No favorite activities yet.',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Start exploring activities!',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return LayoutBuilder(
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
                  onSelect: () => Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) =>
                          ActivityDetailScreen(activity: activities[index]),
                    ),
                  ),
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
                onSelect: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) =>
                        ActivityDetailScreen(activity: activities[index]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
