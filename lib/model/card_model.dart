// To parse this JSON data, do
//
//     final cardModel = cardModelFromJson(jsonString);

import 'dart:convert';

CardModel cardModelFromJson(String str) => CardModel.fromJson(json.decode(str));

String cardModelToJson(CardModel data) => json.encode(data.toJson());

class CardModel {
  CardModel({
    required this.id,
    required this.imagen,
  });

  int id;
  String imagen;

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        imagen: json["imagen"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagen": imagen,
      };
}
