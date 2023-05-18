// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327

import 'package:flutter/material.dart';
import 'HomeScreen.dart';


// Here we are using a global variable. You can use something like
// get_it in a production app.


void main() {

  runApp( HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Quiz App ",
      home: HomeScreen(),
    );
  }

  
}


