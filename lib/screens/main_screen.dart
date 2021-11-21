import 'package:flutter/material.dart';
import './app_1_screen.dart';
import './app_2_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tema 3'),
      ),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                'Basic Phrases',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(App1Screen.routeName);
            },
          ),
          SizedBox(height: 10),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                'Tic-Tac-Toe',
                style: TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(App2Screen.routeName);
            },
          )
        ],
      ),
    );
  }
}
