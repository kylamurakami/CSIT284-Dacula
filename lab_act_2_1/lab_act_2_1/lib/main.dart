import 'package:flutter/material.dart';

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
            child: Text("Hello World"),
            )
            )
            )
    )
            );
}