import 'package:flutter/material.dart';

class MultiPlayer extends StatefulWidget {
  const MultiPlayer({Key? key}) : super(key: key);

  @override
  State<MultiPlayer> createState() => _MultiPlayerState();
}

var gamePad = [
  ['.', '.', '.'],
  ['.', '.', '.'],
  ['.', '.', '.']
];
// for wins count
int xWins = 0;
int oWins = 0;
// to know who is next
bool isXturn = false;
// It's to check how many steps completed
int gameSteps = 0;
// To get the result
String whoWonTheMatch = '';
String activePlayer = 'X';
int turn = 0;
bool isSwitched = false;
UpdateStatus(int i, int j) {
  // Checking whether the button is already clicked or not
  // and also whose turn is this
  if (isXturn && gamePad[i][j] == '.') {
    gamePad[i][j] = 'X';
    isXturn = false;
    gameSteps++;
  } else if (!isXturn && gamePad[i][j] == '.') {
    gamePad[i][j] = 'O';
    isXturn = true;
    gameSteps++;
  }
  if (isXturn) {
    activePlayer = 'X';
  } else {
    activePlayer = 'O';
  }
  // If game steps is >= 5 means user enters the 3 characters
  // So we need to check whether he won or not
  if (gameSteps >= 5) {
    whoWins();
  }
}

// Whole logic to find whether who wins or a draw or the
// game not yet done will be here
whoWins() {
  // Calling the winOrDraw method to check who wins or draw
  String winsOrNot = winOrDraw();
  // If it's X then we need to increment xWins
  // and need to clear all the data except the wins
  if (winsOrNot == 'X') {
    xWins++;
    whoWonTheMatch = 'Winner : X';
    gamePad = [
      ['.', '.', '.'],
      ['.', '.', '.'],
      ['.', '.', '.']
    ];
    gameSteps = 0;
  }
  // Same here aswell checking the win status
  // and resetting the data
  else if (winsOrNot == 'O') {
    oWins++;
    whoWonTheMatch = 'Winner: O';
    gamePad = [
      ['.', '.', '.'],
      ['.', '.', '.'],
      ['.', '.', '.']
    ];
    gameSteps = 0;
  }
  // Checking the Draw situation
  // We only have nine steps so it's checking for it
  else if (gameSteps == 9 && winsOrNot == '') {
    gamePad = [
      ['.', '.', '.'],
      ['.', '.', '.'],
      ['.', '.', '.']
    ];
    gameSteps = 0;
    whoWonTheMatch = 'Draw!!';
  }
}

String winOrDraw() {
  // Checking Diagonally from left to right for X win
  if (gamePad[0][0] == gamePad[1][1] &&
      gamePad[1][1] == gamePad[2][2] &&
      gamePad[2][2] == 'X') {
    return 'X';
  }
  //  Checking Diagonally from left to right for O win
  else if (gamePad[0][0] == gamePad[1][1] &&
      gamePad[1][1] == gamePad[2][2] &&
      gamePad[2][2] == 'O') {
    return 'O';
  }
  // Checking Diagonally from right to left for X win
  else if (gamePad[0][2] == gamePad[1][1] &&
      gamePad[1][1] == gamePad[2][0] &&
      gamePad[2][0] == 'X') {
    return 'X';
  }
  // Checking Diagonally from right to left for X win
  else if (gamePad[0][2] == gamePad[1][1] &&
      gamePad[1][1] == gamePad[2][0] &&
      gamePad[2][0] == 'O') {
    return 'O';
  }
  // Checking horizontal and vertical scenarios
  else {
    int j = 0;
    // looping 3 times because we have only 3x3 grid
    for (int i = 0; i < 3; i++) {
      // Checking ith horizontal row for X win
      if (gamePad[i][j] == gamePad[i][j + 1] &&
          gamePad[i][j + 1] == gamePad[i][j + 2] &&
          gamePad[i][j + 2] == 'X') {
        return 'X';
      }
      // Checking ith horizontal row for O win
      else if (gamePad[i][j] == gamePad[i][j + 1] &&
          gamePad[i][j + 1] == gamePad[i][j + 2] &&
          gamePad[i][j + 2] == 'O') {
        return 'O';
      }
      // Checking ith vertical column for X win
      else if (gamePad[j][i] == gamePad[j + 1][i] &&
          gamePad[j + 1][i] == gamePad[j + 2][i] &&
          gamePad[j + 2][i] == 'X') {
        return 'X';
      }
      // Checking ith vertical column for O win
      else if (gamePad[j][i] == gamePad[j + 1][i] &&
          gamePad[j + 1][i] == gamePad[j + 2][i] &&
          gamePad[j + 2][i] == 'O') {
        return 'O';
      }
    }
  }
  // If it's a draw
  return '';
}

class _MultiPlayerState extends State<MultiPlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/images.jpg"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Turn of : $activePlayer".toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 40),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "X POINTS",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "O POINTS",
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("$xWins")),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("$oWins"),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                whoWonTheMatch,
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: GridView.count(
                      mainAxisSpacing: 30.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 1.0,
                      crossAxisCount: 3,
                      children: [
                    (InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[0][0] == '.') {
                            UpdateStatus(0, 0);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[0][0],
                            style: gamePad[0][0] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[0][1] == '.') {
                            UpdateStatus(0, 1);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[0][1],
                            style: gamePad[0][1] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[0][2] == '.') {
                            UpdateStatus(0, 2);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[0][2],
                            style: gamePad[0][2] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[1][0] == '.') {
                            UpdateStatus(1, 0);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[1][0],
                            style: gamePad[1][0] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[1][1] == '.') {
                            UpdateStatus(1, 1);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[1][1],
                            style: gamePad[1][1] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[1][2] == '.') {
                            UpdateStatus(1, 2);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[1][2],
                            style: gamePad[1][2] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[2][0] == '.') {
                            UpdateStatus(2, 0);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[2][0],
                            style: gamePad[2][0] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[2][1] == '.') {
                            UpdateStatus(2, 1);

                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[2][1],
                            style: gamePad[2][1] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (gamePad[2][2] == '.') {
                            UpdateStatus(2, 2);
                            whoWins();
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).shadowColor,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            gamePad[2][2],
                            style: gamePad[2][2] == 'X'
                                ? const TextStyle(
                                    fontSize: 70, color: Colors.white)
                                : const TextStyle(
                                    fontSize: 70, color: Colors.orange),
                          ),
                        ),
                      ),
                    ),
                  ])),
            ],
          ),
        ),
      ),
    ));
  }
}
