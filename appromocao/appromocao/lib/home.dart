import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promoções"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          //--------Promoções--------------------------------
          CarouselSlider(
            items: [
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage("../assets/promocao1.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage("../assets/promocao2.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                      image: AssetImage("../assets/promocao3.png"),
                      fit: BoxFit.cover),
                ),
              )
            ],
            options: CarouselOptions(
              height: 180.0,
              enlargeCenterPage: true, //alinha ao centro
              autoPlay: true, // ativando o scroll
              aspectRatio: 12 / 9, //proporcao de imagem
              autoPlayCurve: Curves.fastOutSlowIn, //entrada e saida de imagem
              enableInfiniteScroll: true, // sem limite de scroll
              autoPlayAnimationDuration:
                  Duration(milliseconds: 800), // tempo animação
              viewportFraction: 1.0, // modo exibiçao
            ),
          ),

          Container(
            color: Colors.blue,
            height: 150,
            width: 150,
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                Container(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0))),
                  color: Colors.red,
                  height: 150,
                  width: 150,
                )
              ],
            ),
            //  padding: EdgeInsets.symmetric(vertical: 60),
            // color: Colors.blue,
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: <Widget>[
            //     Container(
            //       height: 150,
            //       width: 150,
            //       color: Colors.black,
            //     ),
            //     Padding(padding: EdgeInsets.only(left: 33, top: 10, bottom: 5)),
            //     Container(
            //       height: 150,
            //       width: 150,
            //       color: Colors.grey,
            //     ),
            //   ],
            // ),
          )
        ],
      ),

//------COLUNA
    );
  }
}
