import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/assets_colors/variables.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> Boxes = ["", "", "", "", "", "", "", "", ""];

  bool Xturn = true;

  int xScore = 0;

  int oScore = 0;

  List<int> WinnerBoxes = [];

  String Status = "";

  bool isGameOver = true;

  Timer? timer;

  int seconds = 30;

  List<List<int>> WinningPatterns = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  void HandleOnTap(int index) {
    if (!isGameOver) {
      if (Boxes[index] == "") {
        if (Xturn == true) {
          Boxes[index] = "X";
        } else {
          Boxes[index] = "O";
        }
        Xturn = !Xturn;
        checkWinner();
        setState(() {});
      }
    }
  }

  void handleStartGame() {
    isGameOver = false;
    Boxes = ["", "", "", "", "", "", "", "", ""];
    Status = "";
    WinnerBoxes = [];
    timer?.cancel();
    confettiController.stop();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
      } else {
        Status = "Game Drawn";
        isGameOver = true;
      }
       setState(() {});
    });
   
  }

  void checkWinner() {
    WinningPatterns.forEach((Element) {
      if (Boxes[Element[0]] != "" &&
          Boxes[Element[0]] == Boxes[Element[1]] &&
          Boxes[Element[0]] == Boxes[Element[2]]) {
        if (Boxes[Element[0]] == "X") {
          xScore++;
          Status = "X Wins";
        } else {
          oScore++;
          Status = "O Wins";
        }
        WinnerBoxes = Element;
        isGameOver = true;
        timer?.cancel();
        seconds = 30;
        confettiController.play();
        return;
      }
    });
    if (Boxes.every((e) => e != "")) {
      Status = "Game Drawn";
      isGameOver = true;
      timer?.cancel();
      seconds = 30;
    }
  }

  void clearScores() {
    xScore = 0;
    oScore = 0;
    setState(() {});
  }

  ConfettiController confettiController = ConfettiController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AssetColors.primaryColor,
      body: ConfettiWidget(
        blastDirection: pi / 2,
        blastDirectionality: BlastDirectionality.explosive,
        numberOfParticles: 150,
        colors: [Colors.pink, Colors.purple, Colors.blue],
        gravity: 0.5,
        confettiController: confettiController,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //HEADER SECTION STARTS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Player X",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                           xScore.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),

                    SizedBox(width: 45),

                    Column(
                      children: [
                        SizedBox(height: 15),
                        Text(
                          "Player O",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          oScore.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                //HEADER SECTION ENDS
                Spacer(flex: 1),

                Text(
                  Status,
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),

                //GAME GRID  SECTION STARTS
                SizedBox(
                  height: 440,
                  child: GridView.builder(
                    itemCount: Boxes.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          HandleOnTap(index);
                        },

                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color:
                                WinnerBoxes.contains(index)
                                    ? AssetColors.accentColor
                                    : AssetColors.secondaryColor,
                          ),
                          child: Text(
                            Boxes[index],
                            style: TextStyle(
                              fontSize: 76,
                              color: AssetColors.primaryColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //GAME GRID  SECTION ENDS
                Spacer(flex: 1),

                //FOOTER SECTION STARTS
                isGameOver == true
                    ? Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            handleStartGame();
                          },
                          child: Text("Start"),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            clearScores();
                          },
                          child: Text("Reset Scores"),
                        ),
                      ],
                    )
                    : SizedBox(
                      height: 100,
                      width: 100,
                      child: Stack(
                        fit: StackFit.expand,
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: seconds / 30,
                            strokeWidth: 8,
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                            backgroundColor: AssetColors.secondaryColor,
                          ),
                          Center(
                            child: Text(
                              seconds.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                //FOOTER SECTION ENDS
                Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
