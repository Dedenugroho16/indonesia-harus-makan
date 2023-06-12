// ini adalah halaman home untuk aplikasi Indonesia Harus Makan

// coba branch dan pull request

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  final List<Widget> myData = [
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/1.jpeg"), fit: BoxFit.cover),
            ),
              ),
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/2.jpeg"), fit: BoxFit.cover),
            ),
              ),
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/3.jpeg"), fit: BoxFit.cover),
            ),
              ),
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/4.jpeg"), fit: BoxFit.cover),
            ),
              ),
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/5.jpeg"), fit: BoxFit.cover),
            ),
              ),
              Container(
              decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/img/6.jpeg"), fit: BoxFit.cover),
            ),
              ),
            ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE76F51),
        elevation: 0,
        title: Text('Home'),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFE76F51),
              elevation: 0
            ),
            onPressed: (){ 
            }, 
            child: Text("Login"),
          )
        ],
      ),

      drawer: Drawer(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            color: Color(0xFFE76F51),
            width: double.infinity,
            height: 100,
            child: Text(
              "Dashboard Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  onTap: () {
                    print("Home Diklik");
                  },
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                ),
                ListTile(
                  onTap: () {
                    print("Donasi Diklik");
                  },
                  leading: Icon(Icons.account_balance_wallet_rounded),
                  title: Text("Donasi"),
                ),
                ListTile(
                  onTap: () {
                    print("Laporan Diklik");
                  },
                  leading: Icon(Icons.document_scanner_rounded),
                  title: Text("Laporan"),
                ),
              ],
            ),
          )
        ],
      )),

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xFFF4A261),
          ),

          ListView(
            children: [
              Column(
                children: [
          TextField(
          style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.search),
        hintText: 'Cari di Google',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
          ),
          onChanged: (value) {
          // Lakukan sesuatu dengan nilai pencarian
          },
          ),
                  Container(
                    height: 150,
                    color: Colors.transparent,
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Image.asset("assets/img/logo.png"),
                        Container(
                          width: 210,
                          height: 150,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Indonesia Harus Makan", 
                                  style: TextStyle(
                                    fontSize: 12, 
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  ),
                                ),
                                SizedBox(height: 3,),
                                Text(
                                  "Gerakan sosial berbagi makanan secara gratis bagi mereka yang membutuhkan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 10, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                    
                  ),

                  // carousel slider
                  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        CarouselSlider(
          items: myData,
          carouselController: _controller,
          options: CarouselOptions(
              height: 300,
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 16/9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: myData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),


                ],
              )
            ],
          ),
        ],
      )

    );
  }
}