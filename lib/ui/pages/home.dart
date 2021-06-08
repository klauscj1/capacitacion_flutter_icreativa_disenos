import 'package:disenos_app/model/ciudad_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, size: 35),
                ),
                Text(
                  'travelingg',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 35),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.7),
                borderRadius: BorderRadius.circular(100),
              ),
              height: 75,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                                color: ciudad.seleccionado
                                    ? Colors.white
                                    : Colors.grey),
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
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: size.height * .3,
            width: size.width * .9,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: size.height * .27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          "https://p4.wallpaperbetter.com/wallpaper/713/796/955/canal-amsterdam-cityscape-netherlands-winter-hd-wallpaper-preview.jpg"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      height: 70,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
