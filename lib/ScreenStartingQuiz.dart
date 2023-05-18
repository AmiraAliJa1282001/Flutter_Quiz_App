// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import 'OnBoardContent.dart';
import 'ResultCase1Screen.dart';
import 'ResultCase2Screen.dart';
import 'ResultCase3Screen.dart';
import 'SorryScreen.dart';
import 'db_manager.dart';

class Quizzing extends StatefulWidget {
  const Quizzing({Key? key}) : super(key: key);

  @override
  State<Quizzing> createState() => _QuizzingState();
}

class _QuizzingState extends State<Quizzing>{
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allQuestionsData = [];
  PageController pageController = PageController(initialPage: 0);
   final formGlobalKey = GlobalKey<FormState>();
    int score =0;
  late PageController _pageController;

   @override
    void initState() {
      _query();
      _pageController = PageController(initialPage: 0);

      super.initState();
    }



     
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title:Text('start Quiz'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: allQuestionsData.length,
          itemBuilder: allQuestionsData.length>=5?(BuildContext context, int index) { 
            var qItem = allQuestionsData[index];
            String correctval = qItem['correctChoice'];
          return OnboardContent(
          questionNumber: index+1,
          totalQuestions: allQuestionsData.length,
          questionTitle: '${qItem['questiontitle']}',
          optionA: '${qItem['optionA']}',
          optionB: '${qItem['optionB']}',
          optionC: '${qItem['optionC']}',
          optionD: '${qItem['optionD']}',
          onOptionSelected: (String selectedOption) {
                  _handleOptionSelected(selectedOption, index,correctval);
          },

        )
        ;}:(context, index) => SorryScreen(),
        )

        )
      
    );
  }
  

    void _handleOptionSelected(String selectedOption, int currentIndex, String correctval) {
    // Do something with the selected option
    // For example, update the score
    if (selectedOption == correctval) {
      score++;
    }

    // Navigate to the next screen
    if (_pageController.page!.toInt() < allQuestionsData.length -1) {
      _pageController.nextPage(duration: Duration(milliseconds: 10), curve: Curves.ease);
    } else {
      // Quiz finished, navigate to the result screen or perform any other action
      // calculate average 
      double average = ((score /allQuestionsData.length)*100) ;
      if (average < 50) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultCase3Screen(score: score, total: allQuestionsData.length,)),
      );
    } else if (average < 75) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultCase2Screen(score: score, total: allQuestionsData.length)),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultCase1Screen(score: score, total: allQuestionsData.length)),
      );
    }
    }
  }


   void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
    allQuestionsData = allRows;
    setState(() {});
  }
}