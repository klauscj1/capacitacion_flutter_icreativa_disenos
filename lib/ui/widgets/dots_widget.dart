import 'package:disenos_app/model/slide_item_model.dart';
import 'package:disenos_app/ui/utils/colores.dart';
import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  List<Widget> dibujarPuntos() {
    return slides
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              width: e.index == currentPage ? 45 : 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: DisenoUnoColores.colorTres,
                color: e.index == currentPage
                    ? DisenoUnoColores.colorTres
                    : Colors.grey.withOpacity(.4),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dibujarPuntos(),
      ),
    );
  }
}
