// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327

import 'package:flutter/material.dart';
import 'CreateQuizScreen.dart';
import 'HomeScreen.dart';
import 'ScreenStartingQuiz.dart';
import 'package:flutter/services.dart';

class QuizDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.pink[600],
                  radius: 30,
                  child: Text(
                    'A',
                    style: TextStyle(fontSize: 30),
                    selectionColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Amira Jarghon & Shams Abu loli',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'amira@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Create Quiz'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateQuizScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Start Quiz'),
            onTap: () {
              // TODO: navigate to start quiz screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quizzing()),
              );
            },
          ),
          Divider( // Add a gray line here
            color: Colors.grey[300], // Customize the color if needed
            thickness: 1, // Adjust the thickness if needed
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
                SystemNavigator.pop(); // Exit the app
            },
          ),
        ],
      ),
    );
  }
}
