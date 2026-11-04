import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:campus_hub/models/activity.dart';
import 'package:campus_hub/providers/favorites_provider.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.activity,
    this.showLabel = false,
  });

  final Activity activity;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, favorites, child) {
        final isFavorite = favorites.isFavorite(activity);
        final iconButton = IconButton(
          tooltip: isFavorite ? 'Remove from favorites' : 'Add to favorites',
          onPressed: () => favorites.toggleFavorite(activity),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
              key: ValueKey(isFavorite),
              color: isFavorite ? const Color(0xFF850E35) : null,
            ),
          ),
        );

        if (!showLabel) return iconButton;
        return TextButton.icon(
          onPressed: () => favorites.toggleFavorite(activity),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavorite ? Icons.favorite_rounded : Icons.favorite_border,
              key: ValueKey(isFavorite),
            ),
          ),
          label: Text(isFavorite ? 'Favorited' : 'Favorite'),
        );
      },
    );
  }
}
