// To parse this JSON data, do
//
//     final staff = staffFromJson(jsonString);

import 'dart:convert';

class Staff {
  Staff({
    this.id,
    this.staffNo,
    this.password,
    this.name,
    this.department,
    this.job,
    this.years,
    this.updatedAt,
    this.createdAt,
    this.active,
  });

  String id;
  String staffNo;
  String password;
  String name;
  String department;
  String job;
  String years;
  String updatedAt;
  String createdAt;
  bool active;

  Staff copyWith({
    String id,
    String staffNo,
    String password,
    String name,
    String department,
    String job,
    String years,
    String updatedAt,
    String createdAt,
    bool active,
  }) =>
      Staff(
        id: id ?? this.id,
        staffNo: staffNo ?? this.staffNo,
        password: password ?? this.password,
        name: name ?? this.name,
        department: department ?? this.department,
        job: job ?? this.job,
        years: years ?? this.years,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        active: active ?? this.active,
      );

  factory Staff.fromRawJson(String str) => Staff.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["id"] == null ? null : json["id"],
        staffNo: json["staffNo"] == null ? null : json["staffNo"],
        password: json["password"] == null ? null : json["password"],
        name: json["name"] == null ? null : json["name"],
        department: json["department"] == null ? null : json["department"],
        job: json["job"] == null ? null : json["job"],
        years: json["years"] == null ? null : json["years"],
        updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
        createdAt: json["createdAt"] == null ? null : json["createdAt"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "staffNo": staffNo == null ? null : staffNo,
        "password": password == null ? null : password,
        "name": name == null ? null : name,
        "department": department == null ? null : department,
        "job": job == null ? null : job,
        "years": years == null ? null : years,
        "updatedAt": updatedAt == null ? null : updatedAt,
        "createdAt": createdAt == null ? null : createdAt,
        "active": active == null ? null : active,
      };
}
