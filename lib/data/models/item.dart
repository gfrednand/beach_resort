// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

class Item {
  Item({
    this.id,
    this.name,
    this.code,
    this.type,
    this.unit,
    this.quantity,
    this.amount,
    this.unitPurchasePrice,
    this.unitSalePrice,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String name;
  String code;
  String type;
  String unit;
  int quantity;
  double amount;
  double unitPurchasePrice;
  double unitSalePrice;
  String updatedAt;
  String createdAt;
  int active;

  Item copyWith({
    String id,
    String name,
    String code,
    String type,
    String unit,
    int quantity,
    double amount,
    double unitPurchasePrice,
    int unitSalePrice,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        type: type ?? this.type,
        unit: unit ?? this.unit,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        unitPurchasePrice: unitPurchasePrice ?? this.unitPurchasePrice,
        unitSalePrice: unitSalePrice ?? this.unitSalePrice,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        type: json["type"] == null ? null : json["type"],
        unit: json["unit"] == null ? null : json["unit"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        amount: json["amount"] == null ? null : json["amount"].toDouble(),
        unitPurchasePrice: json["unitPurchasePrice"] == null
            ? null
            : json["unitPurchasePrice"].toDouble(),
        unitSalePrice: json["unitSalePrice"] == null
            ? null
            : json["unitSalePrice"].toDouble(),
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "type": type == null ? null : type,
        "unit": unit == null ? null : unit,
        "quantity": quantity == null ? null : quantity,
        "amount": amount == null ? null : amount,
        "unitPurchasePrice":
            unitPurchasePrice == null ? null : unitPurchasePrice,
        "unitSalePrice": unitSalePrice == null ? null : unitSalePrice,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
