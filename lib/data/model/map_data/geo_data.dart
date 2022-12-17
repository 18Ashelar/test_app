// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app/data/model/map_data/map_data.dart';

class GeoData {
  final GeoMapData? geojson;
  GeoData({
    this.geojson,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'geojson': geojson?.toJson(),
    };
  }

  factory GeoData.fromJson(Map<String, dynamic> map) {
    return GeoData(
      geojson: map['geojson'] != null
          ? GeoMapData.fromJson(json.decode(map['geojson']) as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() => 'GeoData(geojson: $geojson)';
}
