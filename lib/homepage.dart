import 'dart:html';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // To add icons
  var cross = Icon(
    Icons.cancel,
    size: 80,
  );
  var circle = Icon(
    Icons.circle,
    size: 80,
  );
  var edit = Icon(
    Icons.edit,
    size: 80,
  );

  bool isCross = true;
  late String message;
  late List<String> gamestate;

  // Initialize box with empty values

  @override
  void initState() {
    gamestate = List.filled(9, "empty");
    this.message = "";
    super.initState();
  }

  // To play game
  playGame(int index) {
    if (this.gamestate[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gamestate[index] = "cross";
        } else {
          this.gamestate[index] = "circle";
        }

        isCross = !isCross;
        checkWin();
      });
    }
  }

  //To reset game
  resetGame() {
    setState(() {
      gamestate = List.filled(9, "empty");
      this.message = "";
    });
  }

  //To get Icon image
  Icon getIcon(String title) {
    switch (title) {
      case ('empty'):
        return edit;
        break;

      case ('cross'):
        return cross;
        break;

      case ('circle'):
        return circle;
        break;
    }
  }

  //To check the win
  checkWin() {
    if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[1]) &&
        (gamestate[1] == gamestate[2])) {
      setState(() {
        this.message = this.gamestate[0] + 'Win';
      });
    } else if ((gamestate[3] != "empty") &&
        (gamestate[3] == gamestate[4]) &&
        (gamestate[4] == gamestate[5])) {
      setState(() {
        this.message = this.gamestate[3] + 'Win';
      });
    } else if ((gamestate[6] != "empty") &&
        (gamestate[6] == gamestate[7]) &&
        (gamestate[7] == gamestate[8])) {
      setState(() {
        this.message = this.gamestate[6] + 'Win';
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[3]) &&
        (gamestate[3] == gamestate[6])) {
      setState(() {
        this.message = this.gamestate[0] + 'Win';
      });
    } else if ((gamestate[1] != "empty") &&
        (gamestate[1] == gamestate[4]) &&
        (gamestate[4] == gamestate[7])) {
      setState(() {
        this.message = this.gamestate[1] + 'Win';
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[5]) &&
        (gamestate[5] == gamestate[8])) {
      setState(() {
        this.message = this.gamestate[2] + 'Win';
      });
    } else if ((gamestate[0] != "empty") &&
        (gamestate[0] == gamestate[4]) &&
        (gamestate[4] == gamestate[8])) {
      setState(() {
        this.message = this.gamestate[0] + 'Win';
      });
    } else if ((gamestate[2] != "empty") &&
        (gamestate[2] == gamestate[4]) &&
        (gamestate[4] == gamestate[6])) {
      setState(() {
        this.message = this.gamestate[2] + 'Win';
      });
    } else if (!gamestate.contains("empty")) {
      setState(() {
        message = " Stalement";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10),
                itemCount: gamestate.length,
                itemBuilder: (context, i) => SizedBox(
                      width: 100,
                      height: 100,
                      child: MaterialButton(
                          onPressed: () {
                            this.playGame(i);
                          },
                          child: getIcon(this.gamestate[i])),
                    )),
          ),
          Text(
            message,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Container(
            child: MaterialButton(
              color: Colors.blueAccent,
              minWidth: 200,
              onPressed: () => () {
                resetGame();
              },
              child: Text(
                "Reset Game",
                style: TextStyle(
                  color: Colors.white10,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Text("Ronik's Tictactoe"),
        ],
      ),
    );
  }
}
