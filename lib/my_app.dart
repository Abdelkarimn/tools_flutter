import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class MyApp extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeData>(context),
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double result = 0;
  String firstNumber = "";
  String secondNumber = "";
  String optext = "";
  String op = "";
  bool swap = false;
  var items = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var operatinos = <String>["+", "-", "*", "/"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 25,
              width: 100,
              color: Colors.green[100],
              child: Center(child: Text(result.toString())),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 25,
              width: 100,
              color: Colors.red[100],
              child: Center(child: Text(optext)),
            ),
          ),
          Container(
              height: 100,
              child: GridView.count(
                crossAxisCount: 10,
                children: items
                    .map((e) => GestureDetector(
                          key: Key(e.toString()),
                          onTap: () {
                            setState(() {
                              optext = optext + e.toString();
                              print(optext);
                            });

                            if (swap == false) {
                              print(e);
                              firstNumber += (e.toString());
                              print(firstNumber);
                            } else {
                              secondNumber += (e.toString());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                color: Colors.grey,
                                height: 70,
                                width: 70,
                                child: Center(child: Text(e.toString()))),
                          ),
                        ))
                    .toList(),
                shrinkWrap: false,
              )),
          Expanded(
            child: Container(
              child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: operatinos
                      .map((e) => InkWell(
                          key: Key(e.toString()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Center(child: Text(e)),
                              color: Colors.grey,
                            ),
                          ),
                          onTap: () {
                            print(e);
                            print("tapppppppppppppppppppppppppppppp");
                            if (firstNumber != 0) {
                              swap = true;
                              op = e.toString();
                              setState(() {
                                optext = optext + e;
                              });
                            }
                          }))
                      .toList()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              key: Key("enter"),
              onTap: () {
                firstNumber += ".0";
                secondNumber += ".0";
                if (double.parse("$secondNumber") != 0.0) {
                  if (op == "+") {
                    setState(() {
                      result = double.parse("$firstNumber") +
                          double.parse("$secondNumber");
                      print(result);
                    });
                  } else if (op == "*") {
                    setState(() {
                      result = double.parse("$firstNumber") *
                          double.parse("$secondNumber");
                      print(result);
                    });
                  } else if (op == "-") {
                    setState(() {
                      result = double.parse("$firstNumber") -
                          double.parse("$secondNumber");
                      print(result);
                    });
                  } else {
                    setState(() {
                      result = double.parse("$firstNumber") /
                          double.parse("$secondNumber");
                      print(result);
                    });
                  }
                } else {
                  if (double.parse("$firstNumber") != 0.0 && op == "") {
                    setState(() {
                      result = double.parse("$firstNumber");
                      print(result);
                    });
                  } else if (op == "/") {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Column(
                            children: [
                              Container(
                                child: Text("div on zero forbidden"),
                              ),
                              TextButton(
                                child: Text("cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {
                                    optext = "";
                                  });
                                },
                              ),
                            ],
                          );
                        });
                    setState(() {
                      result = 0.0;
                      print(result);
                    });
                  }
                }
              },
              child: Container(
                child: Text("Enter"),
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
