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
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: rolleddice,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              backgroundColor: Colors.green,
              elevation: 25,
              shadowColor: Colors.black),
          child: const CreateText("ROLL DICE", 23, Colors.black, isBold: true),
        )
      ],
    );
  }
}
