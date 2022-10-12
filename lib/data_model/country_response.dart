// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

Country countryFromJson(String str) => Country.fromJson(json.decode(str));

String countryToJson(Country data) => json.encode(data.toJson());

class Country {
  String? abbreviation;
  String? clientIp;

  Country({
    this.abbreviation,
    this.clientIp

  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        abbreviation: json["abbreviation"] ?? '',
    clientIp: json["client_ip"],

      );

  Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
    "client_ip": clientIp,

      };
}
