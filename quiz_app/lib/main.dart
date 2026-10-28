import 'package:flutter/material.dart';
<<<<<<< Updated upstream

import 'package:adv_basics/quiz.dart';

void main() {
  runApp(const Quiz());
}
=======
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body:Container(
         decoration: BoxDecoration(
          gradient: LinearGradient(colors:[Colors.purple, Colors.purple]),
         ),
         child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, children:[
              Image.asset(width: 400, 'assets/logo.png'),
              SizedBox(height: 20),
              TextButton(
                onPressed: (){},
              child: Text(style: TextStyle(),"Start Quiz"),
              child: Text("Learn flutter the fun way!"),
              ),
            ]
            ),
        ),
      ),
     ),
    ),
   );
}
 
>>>>>>> Stashed changes
