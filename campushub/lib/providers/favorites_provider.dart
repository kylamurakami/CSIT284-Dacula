import 'package:flutter/foundation.dart';

import 'package:campus_hub/models/activity.dart';

class FavoritesProvider extends ChangeNotifier {
  final Map<String, Activity> _favorites = {};

  List<Activity> get favorites => List.unmodifiable(_favorites.values);

  bool isFavorite(Activity activity) => _favorites.containsKey(activity.id);

  void toggleFavorite(Activity activity) {
    if (_favorites.containsKey(activity.id)) {
      _favorites.remove(activity.id);
    } else {
      _favorites[activity.id] = activity;
    }
    notifyListeners();
  }

  void addFavorite(Activity activity) {
    if (_favorites.containsKey(activity.id)) return;
    _favorites[activity.id] = activity;
    notifyListeners();
  }

  void removeFavorite(Activity activity) {
    if (_favorites.remove(activity.id) == null) return;
    notifyListeners();
  }
}
