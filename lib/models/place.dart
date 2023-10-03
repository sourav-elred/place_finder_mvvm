class Place {
  final String name;
  final double lat;
  final double long;
  final String placeId;
  final String photoUrl;

  Place({
    required this.name,
    required this.lat,
    required this.long,
    required this.placeId,
    required this.photoUrl,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    final location = json["geometry"]["location"];
    return Place(
      name: json["name"],
      lat: location["lat"],
      long: location["lng"],
      placeId: json["place_id"],
      photoUrl: (json["photos"][0])["photo_reference"],
    );
  }
}
