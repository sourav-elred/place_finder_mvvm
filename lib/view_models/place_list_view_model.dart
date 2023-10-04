import 'package:flutter/material.dart';
import 'package:place_finder_mvvm/models/place.dart';
import 'package:place_finder_mvvm/services/api_service.dart';

class PlaceListViewModel extends ChangeNotifier {
  List<Place> places = [];
  final _webSerivce = ApiService();

  void fetchPlacesByKeywordAndPosition({
    required String keyword,
    required double lat,
    required double long,
  }) async {
    places = await _webSerivce.fetchPlacesByKeywordAndPosition(
      keyword: keyword,
      lat: lat,
      long: long,
    );

    notifyListeners();
  }
}
