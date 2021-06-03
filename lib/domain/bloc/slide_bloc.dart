import 'package:disenos_app/model/services/slide_service.dart';
import 'package:disenos_app/model/slide_item_model.dart';
import 'package:flutter/material.dart';

class SlideBloc extends ChangeNotifier {
  //declaracion de varables
  int _currentPage = 0;
  List<SlideItemModel> _slides = [];
  bool _cargando = false;
  PageController _controllador = PageController();

//los metodos get
  int get currentPage => this._currentPage;
  bool get cargando => this._cargando;
  PageController get controllador => this._controllador;
  List<SlideItemModel> get slides => this._slides;

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
}
