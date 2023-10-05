import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'operatorButton.dart';

void main() {
  runApp(MyApp(title: "Calculator"));
}

class MyApp extends StatefulWidget {
  String title;
  MyApp({super.key, required this.title});

  @override
  State<MyApp> createState() => _MyAppState();
}
String? operator;


class _MyAppState extends State<MyApp> {
  TextEditingController valueOneController = TextEditingController();
  TextEditingController valueTwoController = TextEditingController();
  double? result;
  String? error;
  // String? operator;
  calculate() {
    if (valueOneController.text.isEmpty || valueTwoController.text.isEmpty) {
      // print("Enter Both the Values");
      error = "Enter Both Values";
      return;
    }
    double valueOne = double.parse(valueOneController.text);
    double valueTwo = double.parse(valueTwoController.text);
    switch (operator) {
      case "+":
        result = valueOne + valueTwo;
        error = "";
        break;
      case "*":
        result = valueOne * valueTwo;
        error = "";
        break;
      case "-":
        result = valueOne - valueTwo;
        error = "";
        break;
      case "/":
        result = valueOne / valueTwo;
        if(result==double.infinity){
          error = "Not Defined";
          result=0;
        }else {
          error = "";
        }
        break;
      default:
        error = "Please Select The operator";
    }
    setState(() {});
    // print(result);
  }

  @override
  build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  hintText: "Enter Value one",
                  controller: valueOneController,
                  onTap: () {
                    setState(() {});
                  }),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                  hintText: "Enter Value Two",
                  controller: valueTwoController,
                  onTap: () {
                    setState(() {});
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ["+", "-", "*", "/"]
                    .map((e) => OperatorButton(
                          value: e,
                          onTap: () {
                            setState(() {});
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  calculate();
                },
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: BoxDecoration(
                      color: valueOneController.text.isEmpty ||
                              valueTwoController.text.isEmpty
                          ? Colors.grey
                          : Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
              ),
              Text(
                result.toString(),
                style: const TextStyle(color: Colors.green, fontSize: 30),
              ),
              Text(
                error.toString(),
                style: const TextStyle(color: Colors.red, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class OperatorButton extends StatelessWidget {
  final String value;
  final Function() onTap;

  const OperatorButton({Key? key, required this.value, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        operator = value;
        onTap();
        print(operator);
      },
      child: Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
              color: operator == value ? Colors.green : Colors.black,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ))),
    );
  }
}








