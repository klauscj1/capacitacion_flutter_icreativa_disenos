// To parse this JSON data, do
//
//     final slideItemModel = slideItemModelFromJson(jsonString);

import 'dart:convert';

SlideItemModel slideItemModelFromJson(String str) =>
    SlideItemModel.fromJson(json.decode(str));

String slideItemModelToJson(SlideItemModel data) => json.encode(data.toJson());

class SlideItemModel {
  SlideItemModel({
    required this.titulo,
    required this.imagen,
    required this.index,
  });

  String titulo;
  String imagen;
  int index;

  factory SlideItemModel.fromJson(Map<String, dynamic> json) => SlideItemModel(
        titulo: json["titulo"],
        imagen: json["imagen"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "imagen": imagen,
        "index": index,
      };
}

List<SlideItemModel> slides = [
  SlideItemModel(
    titulo: 'esta es la frase para mostrar al primera imagen de los slides',
    imagen: 'assets/diseno_uno/undraw_Coding_re_iv62.png',
    index: 0,
  ),
  SlideItemModel(
    titulo: 'esta es la frase para mostrar al segunda imagen de los slides',
    imagen: 'assets/diseno_uno/undraw_Lost_re_xqjt.png',
    index: 1,
  ),
  SlideItemModel(
    titulo: 'esta es la frase para mostrar al tercera imagen de los slides',
    imagen: 'assets/diseno_uno/undraw_Mobile_inbox_re_ciwq.png',
    index: 2,
  ),
];
