
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:place_finder_mvvm/models/place.dart';

class ApiService {
  Future<List<Place>> fetchPlacesByKeywordAndPosition(
      {required String keyword,
      required double lat,
      required double long}) async {
    final url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=$keyword&location=$lat,$long&radius=1500&type=restaurant&key=AIzaSyDEjM2UFvu7fEI33_PNbQF2-uNvnXDAJb0";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);

      final Iterable result = decodedResponse["results"];

      return result.map((place) => Place.fromJson(place)).toList();
    } else {
      throw Exception('Unable to perform action');
    }
  }
}
