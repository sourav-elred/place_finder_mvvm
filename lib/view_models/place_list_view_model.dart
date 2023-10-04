import 'package:flutter/material.dart';
import 'package:place_finder_mvvm/services/web_service.dart';
import 'package:place_finder_mvvm/view_models/place_view_model.dart';

class PlaceListViewModel extends ChangeNotifier {
  List<PlaceViewModel> places = [];
  final _webSerivce = WebService();

  void fetchPlacesByKeywordAndPosition({
    required String keyword,
    required double lat,
    required double long,
  }) async {
    final result = await _webSerivce.fetchPlacesByKeywordAndPosition(
      keyword: keyword,
      lat: lat,
      long: long,
    );

    places = result.map((place) => PlaceViewModel(place)).toList();
    notifyListeners();
  }
}
