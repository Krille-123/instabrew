import 'package:flutter/foundation.dart';

class SearchQuery extends ChangeNotifier {
  String query = "";
  void setQuery(newQuery) {
    query = newQuery;
    notifyListeners();
  }
}
