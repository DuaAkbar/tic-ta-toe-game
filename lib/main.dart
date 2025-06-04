import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game_screen.dart';

void main() {
  runApp(tictactoe(),
  );
}

class  tictactoe extends StatelessWidget{
  const tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:  ThemeData(
        fontFamily: "Coiny",
      textTheme: TextTheme(
        titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 24,
          letterSpacing: 3 
        )
      )
    ),
    home: GameScreen(),
   );
  }

}
