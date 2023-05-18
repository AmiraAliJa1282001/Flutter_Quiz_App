// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327
import 'package:flutter/material.dart';

class OnboardContent extends StatelessWidget{
      final int questionNumber;
  final int totalQuestions;
  final String questionTitle;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final Function(String) onOptionSelected;

   const OnboardContent({
    Key? key,
    required this.questionNumber,
    required this.totalQuestions,
    required this.questionTitle,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.onOptionSelected,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[600],
                  ),
                  children: [
                    TextSpan(
                      text: 'Question ${questionNumber.toString()}',
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    TextSpan(
                      text: ' / ${totalQuestions.toString()}',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.0),
              Container(
                 padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  '$questionTitle',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),

              SizedBox(height: 16.0),
              SizedBox(height: 8.0),
              _buildOptionButton(context,'A', optionA),
              SizedBox(height: 8.0),
              _buildOptionButton(context,'B', optionB),
              SizedBox(height: 8.0),
              _buildOptionButton(context,'C', optionC),
              SizedBox(height: 8.0),
              _buildOptionButton(context,'D', optionD),
              SizedBox(height: 16.0),
              
            ],
          ),
        ),
      );
  }
  Widget _buildOptionButton(BuildContext context, String option, String text) {

  return SizedBox(
    height: 48.0,
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: Colors.teal),
        ),
      ),
      onPressed: () {
        onOptionSelected(option);
      },
      child: Text(
        '$text',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  );
}

}