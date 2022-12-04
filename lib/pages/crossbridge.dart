import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nftbridge/function.dart';

class CrossBridge extends StatefulWidget {
  const CrossBridge({super.key});

  @override
  State<CrossBridge> createState() => _CrossBridgeState();
}

class _CrossBridgeState extends State<CrossBridge> {
  String tokenid = '';
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
                    Positioned(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text('Bridge',
                          style: GoogleFonts.pacifico(
                            textStyle: const TextStyle(
                                fontSize: 25, color: Colors.black),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 150,
          child: Row(
            children: [
              const SizedBox(
                width: 350,
              ),
              Image.asset('assets/eth.png', scale: 7),
              Icon(Icons.forward),
              Image.asset(
                'assets/p19.png',
                scale: 2,
              )
            ],
          ),
        ),
        Positioned(
          bottom: 250,
          left: 350,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/eth.png', scale: 15),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Ethereum Goerli',
                          style: GoogleFonts.acme(
                              fontSize: 20, color: Colors.black))
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Icon(Icons.arrow_forward),
                  const SizedBox(
                    width: 70,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/p19.png', scale: 5),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('Polygon Mumbai',
                          style: GoogleFonts.acme(
                              fontSize: 20, color: Colors.black))
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 200,
                  ),
                  Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: TextFormField(
                      onChanged: (value) {
                        tokenid = value;
                      },
                      cursorColor: Colors.black,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'nft tokenId',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      int? vl = int.tryParse(tokenid);
                      F().crossnftbridge(vl!);
                    },
                    child: Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Colors.blueGrey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3)),
                            ]),
                        child: Center(child: Text('Bridge'))),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 80,
          width: 2400,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('mint');
            },
            child: Text('Mint',
                style: GoogleFonts.sacramento(
                  textStyle: TextStyle(fontSize: 30, color: Colors.black),
                )),
          ),
        ),
      ]),
    );
  }
}
