// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327
import 'package:flutter/material.dart';
import 'QuizDrawer.dart';
import 'CreateQuizScreen.dart'; // import the screen you want to navigate to



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      drawer: QuizDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateQuizScreen()),
                );
              },
              child: Image.asset("lib/assets/quiz.png", width: 200,height: 200, fit: BoxFit.fill),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateQuizScreen()),
                );
              },
              child: Text("Let's Start", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
