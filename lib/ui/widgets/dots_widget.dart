import 'package:disenos_app/model/slide_item_model.dart';
import 'package:flutter/material.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    Key? key,
  }) : super(key: key);

  List<Widget> dibujarPuntos() {
    return slides
        .map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                //color: DisenoUnoColores.colorTres,
                color: Colors.grey.withOpacity(.4),
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
