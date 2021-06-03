import 'package:disenos_app/domain/bloc/slide_bloc.dart';
import 'package:disenos_app/ui/utils/colores.dart';
import 'package:disenos_app/ui/widgets/dots_widget.dart';
import 'package:disenos_app/ui/widgets/slide_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisenoUnoPage extends StatelessWidget {
  const DisenoUnoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideBloc = Provider.of<SlideBloc>(context);
    final size = MediaQuery.of(context).size;
    return slideBloc.cargando
        ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
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
                    controller: slideBloc.controllador,
                    onPageChanged: (valor) {
                      slideBloc.currentPage = valor;
                      //setState(() {});
                    },
                    itemBuilder: (_, index) => SlideWidget(
                      slide: slideBloc.slides[index],
                    ),
                    itemCount: slideBloc.slides.length,
                  ),
                ),
              ],
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotsWidget(
                  currentPage: slideBloc.currentPage,
                ),
                slideBloc.currentPage != slideBloc.slides.length - 1
                    ? FloatingActionButton(
                        onPressed: () {
                          slideBloc.controllador.nextPage(
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'login');
                        },
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
