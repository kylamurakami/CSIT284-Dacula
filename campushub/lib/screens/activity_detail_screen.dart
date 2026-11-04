import 'package:flutter/material.dart';

import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/widgets/favorite_button.dart';

class ActivityDetailScreen extends StatelessWidget {
  const ActivityDetailScreen({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(activity.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        actions: [FavoriteButton(activity: activity)],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'activity-image-${activity.id}',
              child: Image.network(
                activity.imageUrl,
                height: 260,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 260,
                  color: theme.colorScheme.primaryContainer,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.event_available_rounded,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity.title, style: theme.textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  Text(
                    activity.description,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  _InfoRow(
                    icon: Icons.place_outlined,
                    label: 'Venue',
                    value: activity.venue,
                  ),
                  _InfoRow(
                    icon: Icons.schedule_rounded,
                    label: 'Duration',
                    value: _durationLabel(activity.duration),
                  ),
                  _InfoRow(
                    icon: Icons.signal_cellular_alt_rounded,
                    label: 'Skill level',
                    value: _capitalize(activity.skillLevel.name),
                  ),
                  const SizedBox(height: 16),
                  _BulletSection(
                    title: 'Requirements',
                    items: activity.requirements,
                    emptyMessage: 'No special requirements.',
                  ),
                  _BulletSection(
                    title: 'Benefits',
                    items: activity.benefits,
                    emptyMessage: 'Details will be announced soon.',
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: FavoriteButton(
                      activity: activity,
                      showLabel: true,
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

  String _durationLabel(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    if (hours == 0) return '$remainingMinutes minutes';
    if (remainingMinutes == 0) return '$hours ${hours == 1 ? 'hour' : 'hours'}';
    return '$hours hr $remainingMinutes min';
  }

  String _capitalize(String value) =>
      '${value[0].toUpperCase()}${value.substring(1)}';
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}

class _BulletSection extends StatelessWidget {
  const _BulletSection({
    required this.title,
    required this.items,
    required this.emptyMessage,
  });

  final String title;
  final List<String> items;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          if (items.isEmpty)
            Text(emptyMessage)
          else
            for (final item in items)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('•  '),
                    Expanded(child: Text(item)),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
