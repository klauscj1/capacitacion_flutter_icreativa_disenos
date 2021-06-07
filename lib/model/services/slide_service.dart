import 'dart:convert';

import 'package:disenos_app/domain/utils/constantes.dart';
import 'package:disenos_app/model/response/slide_response_model.dart';
import 'package:disenos_app/model/slide_item_model.dart';
import "package:http/http.dart" as http;

class SliderService {
  static Future<List<SlideItemModel>>? getSlides() async {
    try {
      var respuesta = await http.get(Uri.parse(API_URL + "slide"));

      var jsonData = json.decode(respuesta.body);
      //SlideResponseModel slideResponse = slideResponseModelFromJson(jsonData);
      SlideResponseModel slideResponse = SlideResponseModel.fromJson(jsonData);
      if (slideResponse.ok) {
        return slideResponse.slides;
      } else {
        return [];
      }
    } catch (error) {
      print(error);
      return [];
    }
  }
}
