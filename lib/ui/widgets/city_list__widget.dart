import 'package:disenos_app/model/ciudad_model.dart';
import 'package:flutter/material.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.7),
          borderRadius: BorderRadius.circular(100),
        ),
        height: 75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ciudades.length,
            itemBuilder: (BuildContext context, int index) {
              final ciudad = ciudades[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Text(
                      ciudad.nombre,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color:
                              ciudad.seleccionado ? Colors.white : Colors.grey),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ciudad.seleccionado
                        ? Container(
                            width: 30,
                            height: 5,
                            color: Colors.blue,
                          )
                        : Container()
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
