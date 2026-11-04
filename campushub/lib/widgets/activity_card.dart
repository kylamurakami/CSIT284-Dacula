import 'package:flutter/material.dart';

import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/widgets/favorite_button.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.activity,
    required this.onSelect,
  });

  final Activity activity;
  final VoidCallback onSelect;

  String get skillLabel {
    final name = activity.skillLevel.name;
    return '${name[0].toUpperCase()}${name.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onSelect,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'activity-image-${activity.id}',
                  child: Image.network(
                    activity.imageUrl,
                    height: 190,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 190,
                      color: theme.colorScheme.primaryContainer,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.event_available_rounded,
                        size: 52,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Material(
                    color: Colors.white.withValues(alpha: 0.92),
                    shape: const CircleBorder(),
                    child: FavoriteButton(activity: activity),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 4),
              child: Text(
                activity.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
              child: Wrap(
                spacing: 12,
                runSpacing: 6,
                children: [
                  _ActivityTrait(
                    icon: Icons.schedule_rounded,
                    label: _durationLabel,
                  ),
                  _ActivityTrait(
                    icon: Icons.signal_cellular_alt_rounded,
                    label: skillLabel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _durationLabel {
    final hours = activity.duration ~/ 60;
    final minutes = activity.duration % 60;
    if (hours == 0) return '$minutes min';
    if (minutes == 0) return '$hours hr';
    return '${hours}h ${minutes}m';
  }
}

class _ActivityTrait extends StatelessWidget {
  const _ActivityTrait({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.secondary),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
