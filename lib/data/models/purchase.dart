// To parse this JSON data, do
//
//     final purchase = purchaseFromJson(jsonString);

import 'dart:convert';

import 'package:beach_resort/data/models/item.dart';

class Purchase {
  Purchase({
    this.id,
    this.totalCost,
    this.paidAmount,
    this.items,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String totalCost;
  double paidAmount;
  List<Item> items;
  String updatedAt;
  String createdAt;
  bool active;

  Purchase copyWith({
    String id,
    String totalCost,
    double paidAmount,
    List<Item> items,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Purchase(
        id: id ?? this.id,
        totalCost: totalCost ?? this.totalCost,
        paidAmount: paidAmount ?? this.paidAmount,
        items: items ?? this.items,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Purchase.fromRawJson(String str) =>
      Purchase.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
        id: json["id"] == null ? null : json["id"],
        totalCost: json["totalCost"] == null ? null : json["totalCost"],
        paidAmount:
            json["paidAmount"] == null ? null : json["paidAmount"].toDouble(),
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "totalCost": totalCost == null ? null : totalCost,
        "paidAmount": paidAmount == null ? null : paidAmount,
        "items": items == null
            ? null
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
