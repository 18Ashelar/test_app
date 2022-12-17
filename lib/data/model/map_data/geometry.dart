// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Geometry {
  final String? type;
  List<dynamic> coordinates;
  Geometry({
    this.type,
    required this.coordinates,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'type': type,
      'coordinates': coordinates,
    };
  }

  factory Geometry.fromJson(Map<String, dynamic> map) {
    return Geometry(
      type: map['type'] != null ? map['type'] as String : null,
      coordinates: List<dynamic>.from(map['coordinates'] as List<dynamic>),
    );
  }

  @override
  String toString() => 'Geometry(type: $type, coordinates: $coordinates)';
}
