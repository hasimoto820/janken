// import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  String myHand = '✊';
  String compHand = '✊';
  String gameResult = '';
  int gameCount = 0;
  // [勝, 負, 分]
  List gameCountDetail = [0, 0, 0];

  void _selectedHand(String selectedHand) {
    gameCount++;
    print('increment');
    print(gameCount.toString());
    myHand = selectedHand;
    compHand = _generateComputerHand();
    gameResult = _getJudge();
    _getGameCount();

    setState(() {});
  }

  String _generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    switch (randomNumber) {
      case 0:
        return '✊';
      case 1:
        return '✌';
      case 2:
        return '✋';
      default:
        return '✊';
    }
  }

  String _getJudge() {
    print('in gameResult');
    print(myHand);
    if (myHand == compHand) {
      gameResult = 'DRAW';
    } else if ((myHand == '✊' && compHand == '✌') ||
        (myHand == '✌' && compHand == '✋') ||
        (myHand == '✋' && compHand == '✊')) {
      gameResult = 'YOU WIN';
    } else {
      gameResult = 'YOU LOOSE';
    }
    return gameResult;
  }

  _getGameCount() {
    if (gameCount > 10) {
      // 初期化
      gameCount = 1;
    } else {
      _incrementGameCountDetail();
    }
  }

  void _incrementGameCountDetail() {
    if (gameResult == 'YOU WIN') {
      gameCountDetail[0]++;
    } else if (gameResult == 'YOU LOOSE') {
      gameCountDetail[1]++;
    } else {
      gameCountDetail[2]++;
    }
    print(gameCountDetail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'じゃんけん',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 202, 255, 203),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  // child: Text('試合数' + gameCount.toString()),
                  children: [
                    Row(
                      children: [
                        Text(
                          '試合数',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          gameCount.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 50),
                Column(
                  children: [
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '勝ち : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          '${gameCountDetail[0]}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    // SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '負け : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          '${gameCountDetail[1]}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                    // SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '引分 : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 40),
                        Text(
                          '${gameCountDetail[2]}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              gameResult,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 100),
            Row(
              children: [
                SizedBox(width: 80),
                Text(
                  'COM',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 80),
                Text(
                  compHand,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                SizedBox(width: 80),
                Text(
                  'MAN',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 80),
                Text(
                  myHand,
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // foreground
                  ),
                  child: Text('✊'),
                  onPressed: () {
                    _selectedHand('✊');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // foreground
                  ),
                  child: Text('✌'),
                  onPressed: () {
                    _selectedHand('✌');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // foreground
                  ),
                  child: Text('✋'),
                  onPressed: () {
                    _selectedHand('✋');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
