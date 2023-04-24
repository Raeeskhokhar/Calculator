import 'package:ch8calculator/components/my_%20button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';

  var result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.indigo,
        child: ListView(children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              accountName: Text('Muhammad Raees'),
              accountEmail: Text(
                'raeeskhancuii@gmail.com',
              ))
        ]),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    userInput.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  result.toString(),
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    MyButton(
                      title: 'AC',
                      onPress: () {
                        userInput = '';
                        result = '';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+/-',
                      onPress: () {
                        userInput += '+/-';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '%',
                      onPress: () {
                        userInput += '%';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '/',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += '/';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '7',
                      onPress: () {
                        userInput += '7';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '8',
                      onPress: () {
                        userInput += '8';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'x',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += 'x';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '4',
                      onPress: () {
                        userInput += '4';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '5',
                      onPress: () {
                        userInput += '5';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '6',
                      onPress: () {
                        userInput += '6';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '-',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '1',
                      onPress: () {
                        userInput += '1';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '2',
                      onPress: () {
                        userInput += '2';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '3',
                      onPress: () {
                        userInput += '3';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '+',
                      color: Color(0xffffa00a),
                      onPress: () {
                        userInput += '+';
                        setState(() {});
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    MyButton(
                      title: '0',
                      onPress: () {
                        userInput += '0';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '-',
                      onPress: () {
                        userInput += '-';
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: 'DEL',
                      onPress: () {
                        userInput =
                            userInput.substring(0, userInput.length - 1);
                        setState(() {});
                      },
                    ),
                    MyButton(
                      title: '=',
                      color: Color(0xffffa00a),
                      onPress: () {
                        equalPress();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    result = eval.toString();
  }
}
