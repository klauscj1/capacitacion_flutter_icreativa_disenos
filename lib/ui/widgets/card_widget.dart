import 'dart:io';

import 'package:disenos_app/model/card_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.tarjeta,
  }) : super(key: key);

  final CardModel tarjeta;
  @override
  Widget build(BuildContext context) {
    final esInternet = tarjeta.imagen.contains("http");
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        height: size.height * .3,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 15,
              right: 15,
              height: size.height * .27,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: esInternet
                    ? Image.network(
                        tarjeta.imagen,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        File(
                          tarjeta.imagen,
                        ),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            Positioned(
              bottom: 15,
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.6),
                            blurRadius: 15,
                            offset: Offset(0, 15),
                          ),
                        ]),
                    height: 70,
                    width: size.width * .7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.favorite_border_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text('50.2k')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.comment_outlined),
                            SizedBox(
                              width: 5,
                            ),
                            Text('490')
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.share),
                            SizedBox(
                              width: 5,
                            ),
                            Text('32')
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
