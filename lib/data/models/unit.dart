// To parse this JSON data, do
//
//     final unit = unitFromJson(jsonString);

import 'dart:convert';

class Unit {
  Unit({
    this.id,
    this.name,
    this.acronym,
  });

  String id;
  String name;
  String acronym;

  Unit copyWith({
    String id,
    String name,
    String acronym,
  }) =>
      Unit(
        id: id ?? this.id,
        name: name ?? this.name,
        acronym: acronym ?? this.acronym,
      );

  factory Unit.fromRawJson(String str) => Unit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        acronym: json["acronym"] == null ? null : json["acronym"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "acronym": acronym == null ? null : acronym,
      };
}
