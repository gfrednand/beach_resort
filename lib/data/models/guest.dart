// To parse this JSON data, do
//
//     final guest = guestFromJson(jsonString);

import 'dart:convert';

class Guest {
  Guest({
    this.id,
    this.guestId,
    this.staffNo,
    this.guestName,
    this.nameOfGroup,
    this.code,
    this.contactAddress,
    this.nationality,
    this.phoneNumber,
    this.companyName,
    this.companyAddress,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String guestId;
  String staffNo;
  String guestName;
  String nameOfGroup;
  String code;
  String contactAddress;
  String nationality;
  String phoneNumber;
  String companyName;
  String companyAddress;
  String updatedAt;
  String createdAt;
  bool active;

  Guest copyWith({
    String id,
    String guestId,
    String staffNo,
    String guestName,
    String nameOfGroup,
    String code,
    String contactAddress,
    String nationality,
    String phoneNumber,
    String companyName,
    String companyAddress,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Guest(
        id: id ?? this.id,
        guestId: guestId ?? this.guestId,
        staffNo: staffNo ?? this.staffNo,
        guestName: guestName ?? this.guestName,
        nameOfGroup: nameOfGroup ?? this.nameOfGroup,
        code: code ?? this.code,
        contactAddress: contactAddress ?? this.contactAddress,
        nationality: nationality ?? this.nationality,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        companyName: companyName ?? this.companyName,
        companyAddress: companyAddress ?? this.companyAddress,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Guest.fromRawJson(String str) => Guest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
        id: json["id"] == null ? null : json["id"],
        guestId: json["guestID"] == null ? null : json["guestID"],
        staffNo: json["staffNo"] == null ? null : json["staffNo"],
        guestName: json["guestName"] == null ? null : json["guestName"],
        nameOfGroup: json["nameOfGroup"] == null ? null : json["nameOfGroup"],
        code: json["code"] == null ? null : json["code"],
        contactAddress:
            json["contactAddress"] == null ? null : json["contactAddress"],
        nationality: json["nationality"] == null ? null : json["nationality"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        companyName: json["companyName"] == null ? null : json["companyName"],
        companyAddress:
            json["companyAddress"] == null ? null : json["companyAddress"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "guestID": guestId == null ? null : guestId,
        "staffNo": staffNo == null ? null : staffNo,
        "guestName": guestName == null ? null : guestName,
        "nameOfGroup": nameOfGroup == null ? null : nameOfGroup,
        "code": code == null ? null : code,
        "contactAddress": contactAddress == null ? null : contactAddress,
        "nationality": nationality == null ? null : nationality,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "companyName": companyName == null ? null : companyName,
        "companyAddress": companyAddress == null ? null : companyAddress,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
