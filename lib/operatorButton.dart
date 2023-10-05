
import 'package:flutter/material.dart';

import 'main.dart';

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