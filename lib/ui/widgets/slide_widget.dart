import 'package:disenos_app/model/slide_item_model.dart';
import 'package:disenos_app/ui/utils/colores.dart';
import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({
    Key? key,
    required this.slide,
  }) : super(key: key);

  final SlideItemModel slide;

  @override
  Widget build(BuildContext context) {
    final esInternet = slide.imagen.contains('http');
    return Column(
      children: [
        //Lottie.asset('assets/diseno_uno/done_animation.json',),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: esInternet
                ? Image.network(slide.imagen)
                : Image.asset(
                    slide.imagen,
                    fit: BoxFit.fitHeight,
                  ),
          ),
        ),

        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              slide.titulo,
              style: TextStyle(
                color: DisenoUnoColores.colorCuatro,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
