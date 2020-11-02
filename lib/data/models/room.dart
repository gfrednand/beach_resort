// To parse this JSON data, do
//
//     final room = roomFromJson(jsonString);

import 'dart:convert';

class Room {
  Room({
    this.id,
    this.roomNo,
    this.rateOfRoom,
    this.phoneNumber,
    this.statusOfRoom,
    this.description,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String roomNo;
  String rateOfRoom;
  String phoneNumber;
  String statusOfRoom;
  String description;
  String updatedAt;
  String createdAt;
  bool active;

  Room copyWith({
    String id,
    String roomNo,
    String rateOfRoom,
    String phoneNumber,
    String statusOfRoom,
    String description,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Room(
        id: id ?? this.id,
        roomNo: roomNo ?? this.roomNo,
        rateOfRoom: rateOfRoom ?? this.rateOfRoom,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        statusOfRoom: statusOfRoom ?? this.statusOfRoom,
        description: description ?? this.description,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Room.fromRawJson(String str) => Room.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"] == null ? null : json["id"],
        roomNo: json["roomNo"] == null ? null : json["roomNo"],
        rateOfRoom: json["rateOfRoom"] == null ? null : json["rateOfRoom"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        statusOfRoom:
            json["statusOfRoom"] == null ? null : json["statusOfRoom"],
        description: json["description"] == null ? null : json["description"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "roomNo": roomNo == null ? null : roomNo,
        "rateOfRoom": rateOfRoom == null ? null : rateOfRoom,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "statusOfRoom": statusOfRoom == null ? null : statusOfRoom,
        "description": description == null ? null : description,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
