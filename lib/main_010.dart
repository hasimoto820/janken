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

  void selectedHand(String selectedHand) {
    myHand = selectedHand;
    print('@@@');
    print(myHand);
    compHand = generateComputerHand();
    setState(() {});
  }

  String generateComputerHand() {
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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 150),
            Text(
              compHand,
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            SizedBox(height: 150),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 50,
              ),
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
                    selectedHand('✊');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // foreground
                  ),
                  child: Text('✌'),
                  onPressed: () {
                    selectedHand('✌');
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // foreground
                  ),
                  child: Text('✋'),
                  onPressed: () {
                    selectedHand('✋');
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
