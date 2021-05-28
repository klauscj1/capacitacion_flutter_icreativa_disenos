import 'package:disenos_app/model/slide_item_model.dart';
import 'package:disenos_app/ui/utils/colores.dart';
import 'package:disenos_app/ui/widgets/dots_widget.dart';
import 'package:disenos_app/ui/widgets/slide_widget.dart';
import 'package:flutter/material.dart';

class DisenoUnoPage extends StatefulWidget {
  const DisenoUnoPage({Key? key}) : super(key: key);

  @override
  _DisenoUnoPageState createState() => _DisenoUnoPageState();
}

class _DisenoUnoPageState extends State<DisenoUnoPage> {
  late int currentPage;
  final controllador = PageController();

  @override
  void initState() {
    currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
            height: size.height * 0.7,
            child: PageView.builder(
              controller: controllador,
              onPageChanged: (valor) {
                currentPage = valor;
                setState(() {});
              },
              itemBuilder: (_, index) => SlideWidget(
                slide: slides[index],
              ),
              itemCount: slides.length,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DotsWidget(
            currentPage: currentPage,
          ),
          currentPage != slides.length - 1
              ? FloatingActionButton(
                  onPressed: () {
                    controllador.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                  },
                  backgroundColor: DisenoUnoColores.colorUno,
                  child: Icon(
                    Icons.chevron_right,
                    size: 40,
                  ),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: DisenoUnoColores.colorUno,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 5,
                    ),
                    child: Text(
                      'Get started',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
