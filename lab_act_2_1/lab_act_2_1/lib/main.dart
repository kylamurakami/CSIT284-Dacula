import 'package:flutter/material.dart';
import 'package:lab_act_2_1/dice_roller.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.red, 
              Colors.pink
            ])
          ),
          child: Center(
            child: DiceRoller()
            ),
            )
    )
            )
  );
}