import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  final String label, slabel;

  BuyPage({required this.label, required this.slabel});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  TextEditingController textEditingController = TextEditingController();
  double result = 0.0;

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(calculateResult);
  }

  @override
  void dispose() {
    textEditingController.removeListener(calculateResult);
    textEditingController.dispose();
    super.dispose();
  }

  void calculateResult() {
    setState(() {
      double number = double.tryParse(textEditingController.text) ?? 0.0;
      double slabel = double.tryParse(widget.slabel) ?? 1.0;
      result = number / slabel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131324),
      appBar: AppBar(
        title: Text("Buy ${widget.label}"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff181826),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("${widget.label}",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Text("\$ ${widget.slabel}",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                  hintText: "Enter the amount to buy",
                                  suffix: Text(
                                    "USD",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  border: InputBorder.none),
                              onChanged: (value) {
                                setState(() {});
                                calculateResult();
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("you get"),
                                    Text(
                                      '${result.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "${widget.label}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800),
                                ),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                        "Congratulations $result amount has credited to your account"),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Buy Now",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.navigate_next,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff131324)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
