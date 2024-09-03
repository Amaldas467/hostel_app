import 'package:flutter/material.dart';

import '../../homescreen/widgets/hostelcard.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Hostelcard> _favoriteHostels = [];
  Map<String, bool> _favoriteStatus = {};

  List<Hostelcard> get favoriteHostels => _favoriteHostels;
  Map<String, bool> get favoriteStatus => _favoriteStatus;

  void toggleFavorite(Hostelcard hostel) {
    bool isFavorite = _favoriteStatus[hostel.id] ?? false;

    if (isFavorite) {
      _favoriteHostels.removeWhere((h) => h.id == hostel.id);
    } else {
      _favoriteHostels.add(hostel);
    }

    _favoriteStatus[hostel.id] = !isFavorite;
    notifyListeners();
  }
}
