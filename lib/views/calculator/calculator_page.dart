import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;

  onButtonClick(value) {
    if (value == "AC") {
      input = '';
      output = '';
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == "=") {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll("x", '*');
        Parser p = Parser();
        Expression exp = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = exp.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        // input = output;
      }
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                input,
                style: const TextStyle(
                    fontSize: 48,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                output,
                style: const TextStyle(
                    fontSize: 38,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )),
        Row(children: [
          button(text: "AC", tColor: Colors.orange),
          button(text: "<", tColor: Colors.orange),
          button(text: "", buttonbgColor: Colors.transparent),
          button(text: "/", tColor: Colors.orange),
        ]),
        Row(children: [
          button(text: "7"),
          button(text: "8"),
          button(text: "9"),
          button(text: "x", tColor: Colors.red),
        ]),
        Row(children: [
          button(text: "4"),
          button(text: "5"),
          button(text: "6"),
          button(text: "-", tColor: Colors.red),
        ]),
        Row(children: [
          button(text: "1"),
          button(text: "2"),
          button(text: "3"),
          button(text: "+", tColor: Colors.red),
        ]),
        Row(children: [
          button(text: "%"),
          button(text: "0"),
          button(text: "."),
          button(text: "=", tColor: Colors.white, buttonbgColor: Colors.orange),
        ]),
      ]),
    );
  }

  Widget button({text, tColor = Colors.white, buttonbgColor = Colors.grey}) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          padding: const EdgeInsets.all(22),
          backgroundColor: buttonbgColor,
        ),
        onPressed: () {
          onButtonClick(text);
        },
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18, color: tColor, fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
