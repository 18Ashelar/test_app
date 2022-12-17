// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_app/data/model/map_data/geometry.dart';
import 'package:test_app/data/model/map_data/properties.dart';

class GeoMapData {
  final Geometry? geometry;
  final Properties? properties;

  GeoMapData(this.geometry, this.properties);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'geometry': geometry?.toJson(),
      'properties': properties?.toJson(),
    };
  }

  factory GeoMapData.fromJson(Map<String, dynamic> map) {
    return GeoMapData(
      map['geometry'] != null ? Geometry.fromJson(map['geometry'] as Map<String,dynamic>) : null,
      map['properties'] != null ? Properties.fromJson(map['properties'] as Map<String,dynamic>) : null,
    );
  }

  @override
  String toString() => 'GeoMapData(geometry: $geometry, properties: $properties)';
}
