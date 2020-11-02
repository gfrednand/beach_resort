// To parse this JSON data, do
//
//     final bookingRoom = bookingRoomFromJson(jsonString);

import 'dart:convert';

class BookingRoom {
  BookingRoom({
    this.id,
    this.bookingRoomId,
    this.guestId,
    this.staffNo,
    this.roomNo,
    this.createdDate,
    this.dateOfArrival,
    this.dateOfDeparture,
    this.stakeMoney,
    this.specialRequirement,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String bookingRoomId;
  String guestId;
  String staffNo;
  String roomNo;
  String createdDate;
  String dateOfArrival;
  String dateOfDeparture;
  String stakeMoney;
  String specialRequirement;
  String updatedAt;
  String createdAt;
  bool active;

  BookingRoom copyWith({
    String id,
    String bookingRoomId,
    String guestId,
    String staffNo,
    String roomNo,
    String createdDate,
    String dateOfArrival,
    String dateOfDeparture,
    String stakeMoney,
    String specialRequirement,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      BookingRoom(
        id: id ?? this.id,
        bookingRoomId: bookingRoomId ?? this.bookingRoomId,
        guestId: guestId ?? this.guestId,
        staffNo: staffNo ?? this.staffNo,
        roomNo: roomNo ?? this.roomNo,
        createdDate: createdDate ?? this.createdDate,
        dateOfArrival: dateOfArrival ?? this.dateOfArrival,
        dateOfDeparture: dateOfDeparture ?? this.dateOfDeparture,
        stakeMoney: stakeMoney ?? this.stakeMoney,
        specialRequirement: specialRequirement ?? this.specialRequirement,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory BookingRoom.fromRawJson(String str) =>
      BookingRoom.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BookingRoom.fromJson(Map<String, dynamic> json) => BookingRoom(
        id: json["id"] == null ? null : json["id"],
        bookingRoomId:
            json["bookingRoomID"] == null ? null : json["bookingRoomID"],
        guestId: json["guestID"] == null ? null : json["guestID"],
        staffNo: json["staffNo"] == null ? null : json["staffNo"],
        roomNo: json["roomNo"] == null ? null : json["roomNo"],
        createdDate: json["createdDate"] == null ? null : json["createdDate"],
        dateOfArrival:
            json["dateOfArrival"] == null ? null : json["dateOfArrival"],
        dateOfDeparture:
            json["dateOfDeparture"] == null ? null : json["dateOfDeparture"],
        stakeMoney: json["stakeMoney"] == null ? null : json["stakeMoney"],
        specialRequirement: json["specialRequirement"] == null
            ? null
            : json["specialRequirement"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "bookingRoomID": bookingRoomId == null ? null : bookingRoomId,
        "guestID": guestId == null ? null : guestId,
        "staffNo": staffNo == null ? null : staffNo,
        "roomNo": roomNo == null ? null : roomNo,
        "createdDate": createdDate == null ? null : createdDate,
        "dateOfArrival": dateOfArrival == null ? null : dateOfArrival,
        "dateOfDeparture": dateOfDeparture == null ? null : dateOfDeparture,
        "stakeMoney": stakeMoney == null ? null : stakeMoney,
        "specialRequirement":
            specialRequirement == null ? null : specialRequirement,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
