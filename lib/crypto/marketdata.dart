import 'dart:convert';

import 'package:cli/crypto/buy_page.dart';
import 'package:cli/signUpPage/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Marketdata extends StatefulWidget {
  const Marketdata({super.key});

  @override
  State<Marketdata> createState() => _MarketdataState();
}

class _MarketdataState extends State<Marketdata> {
  var data;
  Future<void> getcoindata() async {
    final response = await http.get(Uri.parse(
        "https://rest.coinapi.io/v1/assets/apikey-76306401-87A2-44B2-8CE2-BCE2A9CB1677"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181825),
      appBar: AppBar(
        title: Text(
          "Crypto Prices",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coin", style: style2),
                Text(
                  "Price",
                  style: style2,
                ),
                Text(
                  " Buy option",
                  style: style2,
                ),
              ],
            )),
          ),
          Expanded(
            child: FutureBuilder(
              future: getcoindata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.inkDrop(
                        color: Colors.yellow, size: 50),
                  );
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      // > 10 ? 10 : data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: Container(
                                                  width: 100,
                                                  child: Text(
                                                    data[index]['asset_id']
                                                        .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                data[index]['name'].toString(),
                                                style: TextStyle(
                                                    color: Color(0xff61616B),
                                                    fontSize: 8.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        data[index]['price_usd'].toString(),
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Flexible(
                                      child: Container(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BuyPage(
                                                          label: data[index]
                                                                  ['asset_id']
                                                              .toString(),
                                                          slabel: data[index]
                                                                  ['price_usd']
                                                              .toString(),
                                                        )));
                                          },
                                          child: Text(
                                            "BUY",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
