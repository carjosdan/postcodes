class DataPlace {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double? elevation;
  final String? featureCode;
  final String? countryCode;
  final int? admin1Id;
  final int? admin2Id;
  final int? admin3Id;
  final String? timezone;
  final int? population;
  final List<String> postcodes;
  final int? countryId;
  final String? country;
  final String? admin1;
  final String? admin2;
  final String? admin3;

  DataPlace({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.admin1Id,
    required this.admin2Id,
    required this.admin3Id,
    required this.timezone,
    required this.population,
    required this.postcodes,
    required this.countryId,
    required this.country,
    required this.admin1,
    required this.admin2,
    required this.admin3,
  });

  factory DataPlace.fromJson(Map<String, dynamic> json) => DataPlace(
    id: json["id"],
    name: json["name"],
    latitude: (json["latitude"] as num).toDouble(),
    longitude: (json["longitude"] as num).toDouble(),
    elevation: (json["elevation"] as num?)?.toDouble(),
    featureCode: json["feature_code"],
    countryCode: json["country_code"],
    admin1Id: json["admin1_id"],
    admin2Id: json["admin2_id"],
    admin3Id: json["admin3_id"],
    timezone: json["timezone"],
    population: json["population"] as int?,
    postcodes: json["postcodes"] == null
        ? <String>[]
        : List<String>.from(json["postcodes"].map((x) => x)),
    countryId: json["country_id"],
    country: json["country"],
    admin1: json["admin1"],
    admin2: json["admin2"],
    admin3: json["admin3"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "elevation": elevation,
    "feature_code": featureCode,
    "country_code": countryCode,
    "admin1_id": admin1Id,
    "admin2_id": admin2Id,
    "admin3_id": admin3Id,
    "timezone": timezone,
    "population": population,
    "postcodes": List<dynamic>.from(postcodes.map((x) => x)),
    "country_id": countryId,
    "country": country,
    "admin1": admin1,
    "admin2": admin2,
    "admin3": admin3,
  };
}
