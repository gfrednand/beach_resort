// To parse this JSON data, do
//
//     final sale = saleFromJson(jsonString);

import 'dart:convert';

import 'package:beach_resort/data/models/item.dart';

class Sale {
  Sale({
    this.id,
    this.staffNo,
    this.guestId,
    this.paidAmount,
    this.reservation,
    this.totalCost,
    this.items,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String staffNo;
  String guestId;
  double paidAmount;
  String reservation;
  String totalCost;
  List<Item> items;
  String updatedAt;
  String createdAt;
  bool active;

  Sale copyWith({
    String id,
    String staffNo,
    String guestId,
    double paidAmount,
    String reservation,
    String totalCost,
    List<Item> items,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Sale(
        id: id ?? this.id,
        staffNo: staffNo ?? this.staffNo,
        guestId: guestId ?? this.guestId,
        paidAmount: paidAmount ?? this.paidAmount,
        reservation: reservation ?? this.reservation,
        totalCost: totalCost ?? this.totalCost,
        items: items ?? this.items,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Sale.fromRawJson(String str) => Sale.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sale.fromJson(Map<String, dynamic> json) => Sale(
        id: json["id"] == null ? null : json["id"],
        staffNo: json["staffNo"] == null ? null : json["staffNo"],
        guestId: json["guestID"] == null ? null : json["guestID"],
        paidAmount:
            json["paidAmount"] == null ? null : json["paidAmount"].toDouble(),
        reservation: json["reservation"] == null ? null : json["reservation"],
        totalCost: json["totalCost"] == null ? null : json["totalCost"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "staffNo": staffNo == null ? null : staffNo,
        "guestID": guestId == null ? null : guestId,
        "paidAmount": paidAmount == null ? null : paidAmount,
        "reservation": reservation == null ? null : reservation,
        "totalCost": totalCost == null ? null : totalCost,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
