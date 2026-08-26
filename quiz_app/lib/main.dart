import 'package:flutter/material.dart';
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color.fromARGB(255, 73, 7, 189),
              const Color.fromARGB(255, 73, 6, 184),
            ])
          ),
        child: Center(
          child: Text('Learn flutter the fun way')
 
        ),
        ),
      ),
    ),
  );
}