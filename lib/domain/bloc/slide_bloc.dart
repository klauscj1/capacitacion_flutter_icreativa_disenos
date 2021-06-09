import 'package:disenos_app/model/card_model.dart';
import 'package:disenos_app/model/services/slide_service.dart';
import 'package:disenos_app/model/slide_item_model.dart';
import 'package:flutter/material.dart';

class SlideBloc extends ChangeNotifier {
  //declaracion de varables
  int _currentPage = 0;
  List<SlideItemModel> _slides = [];
  bool _cargando = false;
  PageController _controllador = PageController();

  List<CardModel> _tarjetas = [
    CardModel(
        id: 0,
        imagen:
            "https://p4.wallpaperbetter.com/wallpaper/713/796/955/canal-amsterdam-cityscape-netherlands-winter-hd-wallpaper-preview.jpg"),
    CardModel(
        id: 0,
        imagen:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDgn3k_GdYORDI4KSb-njV4qhyYhBNBnJ32Q&usqp=CAU"),
  ];

//los metodos get
  int get currentPage => this._currentPage;
  bool get cargando => this._cargando;
  PageController get controllador => this._controllador;
  List<SlideItemModel> get slides => this._slides;
  List<CardModel> get tarjetas => this._tarjetas;

//metodos set
  set currentPage(int valor) {
    this._currentPage = valor;
    notifyListeners();
  }

  set slides(List<SlideItemModel> lista) {
    this._slides = lista;
    notifyListeners();
  }

//metodos propios del bloc
  void cargarSlides() async {
    this._cargando = true;
    this._slides = await SliderService.getSlides()!;
    this._cargando = false;
    notifyListeners();
  }

  void addCard(CardModel tarjeta) {
    this._tarjetas.add(tarjeta);
    notifyListeners();
  }
}
