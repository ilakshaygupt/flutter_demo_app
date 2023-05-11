import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_application_1/create_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = Random().nextInt(6) + 1;

  void rolleddice() {
    setState(() {
      //tells flutter to reexecute the build function
      currentDiceRoll = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/dice-$currentDiceRoll.png', width: 200),
        TextButton(
          onPressed: rolleddice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontSize: 28),
          ),
          child: const CreateText("ROLL DICE", 40, Colors.black, isBold: true),
        )
      ],
    );
  }
}
