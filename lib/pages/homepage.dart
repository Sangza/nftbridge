// ignore: depend_on_referenced_packages
import 'package:coverflow/coverflow.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:nftbridge/function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> titles = [
    "1.Webbed face",
    "2.Old Shoe",
    "3.Dollar bill",
    "4.Blanket",
    "5.Flower",
    "6.Hali Festival",
    "7.Outdoor",
    "8.Lamb of God",
    "9.Fashion",
    "10.Neurons",
    "11.Coloured canvas",
    "12.Art",
    "13.Statue",
    "14.The Arabic Letters",
    "15.African Queen",
    "16.Beautiful",
  ];

  List<Widget> images2 = [
    Image.asset('assets/1.jpg'),
    Image.asset('assets/2.jpg'),
    Image.asset('assets/3.jpg'),
    Image.asset('assets/4.jpg'),
    Image.asset('assets/5.jpg'),
    Image.asset('assets/6.jpg'),
    Image.asset('assets/7.jpg'),
    Image.asset('assets/8.jpg'),
    Image.asset('assets/9.jpg'),
    Image.asset('assets/10.jpg'),
    Image.asset('assets/11.jpg'),
    Image.asset('assets/12.jpg'),
    Image.asset('assets/13.jpg'),
    Image.asset('assets/14.jpg'),
    Image.asset('assets/15.jpg'),
    Image.asset('assets/16.jpg'),
  ];

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(children: [
        Container(
          color: Color.alphaBlend(const Color.fromARGB(255, 214, 233, 242),
              const Color.fromARGB(255, 255, 255, 255)),
          child: Padding(
            padding: const EdgeInsets.only(left: 250, top: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Mint',
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                              fontSize: 25, color: Colors.black),
                        )),
                    Positioned(
                      top: 10,
                      child: FutureBuilder<Object>(
                        builder: (context, snapshot) {
                          return Center(
                            child: Text(
                              '${snapshot.data as dynamic}',
                              style: GoogleFonts.zenDots(),
                            ),
                          );
                        },
                        future: F().ff(),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 450,
          top: 150,
          child: Text(
            'Mint a random Nft in Goerli and bridge it to Mumbai',
            style: GoogleFonts.pacifico(
                textStyle: const TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            )),
          ),
        ),
        Positioned(
          bottom: 210,
          left: 250,
          child: Container(
            height: 400,
            width: 1100,
            color: Colors.transparent,
            child: CoverFlow(
              images: images2,
              titles: titles,
              textStyle: GoogleFonts.firaCode(),
              displayOnlyCenterTitle: true,
              onCenterItemSelected: (index) {
                print('Selected Item\'s index: $index');
              },
              shadowOffset: const Offset(3, 8),
            ),
          ),
        ),
        Positioned(
          left: 700,
          bottom: 170,
          child: TextButton(
            onPressed: () {
              F().mint();
              setState(() {
                pressed = true;
              });
            },
            child: Container(
                height: 50,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3)),
                    ]),
                child: Center(child: Text('MINT'))),
          ),
        ),
        Positioned(
            left: 725,
            bottom: 120,
            child: pressed == false
                ? Container()
                : FutureBuilder<Object>(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        } else if (pressed == true && snapshot.hasData) {
                          final data = snapshot.data as String;
                          return AlertDialog(
                            actions: [
                              Center(
                                child: SelectableText(
                                  '$data',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          );
                        }
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    future: F().supply(),
                  )),
        Positioned(
          right: 150,
          bottom: 70,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('crossbridge');
            },
            child: Text('Bridge',
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(fontSize: 25, color: Colors.black),
                )),
          ),
        )
      ]),
    );
  }
}
