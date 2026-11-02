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

  factory DataPlace.empty() => DataPlace(
        id: 0,
        name: '',
        latitude: 0,
        longitude: 0,
        elevation: null,
        featureCode: null,
        countryCode: null,
        admin1Id: null,
        admin2Id: null,
        admin3Id: null,
        timezone: null,
        population: null,
        postcodes: const [],
        countryId: null,
        country: null,
        admin1: null,
        admin2: null,
        admin3: null,
      );

  factory DataPlace.fromJson(Map<String, dynamic> json) => DataPlace(
        id: _asInt(json['id']) ?? 0,
        name: _asString(json['name']) ?? '',
        latitude: _asDouble(json['latitude']) ?? 0.0,
        longitude: _asDouble(json['longitude']) ?? 0.0,
        elevation: _asDouble(json['elevation']),
        featureCode: _asString(json['feature_code']),
        countryCode: _asString(json['country_code']),
        admin1Id: _asInt(json['admin1_id']),
        admin2Id: _asInt(json['admin2_id']),
        admin3Id: _asInt(json['admin3_id']),
        timezone: _asString(json['timezone']),
        population: _asInt(json['population']),
        postcodes: _asStringList(json['postcodes']),
        countryId: _asInt(json['country_id']),
        country: _asString(json['country']),
        admin1: _asString(json['admin1']),
        admin2: _asString(json['admin2']),
        admin3: _asString(json['admin3']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'latitude': latitude,
    'longitude': longitude,
    'elevation': elevation,
    'feature_code': featureCode,
    'country_code': countryCode,
    'admin1_id': admin1Id,
    'admin2_id': admin2Id,
    'admin3_id': admin3Id,
    'timezone': timezone,
    'population': population,
    'postcodes': List<dynamic>.from(postcodes.map((x) => x)),
    'country_id': countryId,
    'country': country,
    'admin1': admin1,
    'admin2': admin2,
    'admin3': admin3,
  };
}

int? _asInt(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is int) {
    return value;
  }

  if (value is num) {
    return value.toInt();
  }

  return int.tryParse(value.toString());
}

double? _asDouble(dynamic value) {
  if (value == null) {
    return null;
  }

  if (value is num) {
    return value.toDouble();
  }

  return double.tryParse(value.toString());
}

String? _asString(dynamic value) {
  if (value == null) {
    return null;
  }

  return value.toString();
}

List<String> _asStringList(dynamic value) {
  if (value == null) {
    return const <String>[];
  }

  if (value is Iterable) {
    return value
        .map((entry) => entry?.toString() ?? '')
        .where((entry) => entry.isNotEmpty)
        .toList(growable: false);
  }

  final text = value.toString();
  return text.isEmpty ? const <String>[] : <String>[text];
}
