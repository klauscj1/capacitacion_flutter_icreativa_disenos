import 'package:disenos_app/model/slide_item_model.dart';
import 'package:disenos_app/ui/utils/colores.dart';
import 'package:disenos_app/ui/widgets/dots_widget.dart';
import 'package:disenos_app/ui/widgets/slide_widget.dart';
import 'package:flutter/material.dart';

class DisenoUnoPage extends StatelessWidget {
  const DisenoUnoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: DisenoUnoColores.colorCuatro,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 600,
            child: PageView(
              children: [
                SlideWidget(
                  slide: slides[0],
                ),
                SlideWidget(
                  slide: slides[1],
                ),
                SlideWidget(
                  slide: slides[2],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotsWidget(),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: DisenoUnoColores.colorUno,
            child: Icon(
              Icons.chevron_right,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
