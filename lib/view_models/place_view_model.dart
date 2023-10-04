import 'package:place_finder_mvvm/models/place.dart';

class PlaceViewModel {
  Place _place;

  PlaceViewModel(Place place) : _place = place;

  String get placeId => _place.placeId;

  String get photoUrl => _place.photoUrl;

  String get name => _place.name;

  double get latitude => _place.lat;

  double get longitude => _place.long;
}
