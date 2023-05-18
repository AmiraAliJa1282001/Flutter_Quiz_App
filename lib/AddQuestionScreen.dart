// Name                    ID
// Amira ALi Jarghon       20192182
// Shams Naem Abu louli    20192327
import 'package:flutter/material.dart';
import 'package:flutter_application_final/db_manager.dart';

import 'package:flutter_application_final/models/QuestionsModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'CreateQuizScreen.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({Key? key}) : super(key: key);
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Map<String, dynamic>> allQuestionsData = [];
  TextEditingController _questiontitleController = TextEditingController();
  TextEditingController _optionAController = TextEditingController();
  TextEditingController _optionBController = TextEditingController();
  TextEditingController _optionCController = TextEditingController();
  TextEditingController _optionDController = TextEditingController();
  TextEditingController _correctChoiceController = TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  String _selectedAnswer = 'A';
  
    @override
  void initState() {
      dbHelper.database;
    _query();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Add new question'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formGlobalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _questiontitleController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal)
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  labelText: 'Question',
                  labelStyle: TextStyle(color: Colors.grey[700]),
                  prefixIcon: Icon(
                    Icons.question_mark,
                    color: Colors.grey[700],
                  ),
                ),
                maxLines: null,
              ),
              SizedBox(height: 16.0),
              _buildAnswerField('A'),
              SizedBox(height: 16.0),
              _buildAnswerField('B'),
              SizedBox(height: 16.0),
              _buildAnswerField('C'),
              SizedBox(height: 16.0),
              _buildAnswerField('D'),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select the correct answer:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  DropdownButton<String>(
                    value: _selectedAnswer,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedAnswer = newValue!;
                      });
                    },

                    items: ['A', 'B', 'C', 'D']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(

                          padding: EdgeInsets.all(10), // add padding
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.teal, // set the color to teal
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  _insert();
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateQuizScreen()),
                );
                },

                style: ElevatedButton.styleFrom(
                  primary: Colors.teal,
                  padding: EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 16.0,
                  ),
                ),
                child: Text(
                  'Add question',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerField(String answer) {
    Color backgroundColor;
    String choicelabel;
    final _controlerOption;
    switch (answer) {
      case 'A':
        backgroundColor = Colors.yellow;
        choicelabel = "First";
        _controlerOption= _optionAController;
        break;
      case 'B':
        backgroundColor = Colors.green;
        choicelabel = "Second";
        _controlerOption= _optionBController;
        break;
      case 'C':
        backgroundColor = Colors.grey;
        choicelabel = "Third";
        _controlerOption= _optionCController;
        break;
      case 'D':
        backgroundColor = Colors.pink;
        choicelabel = "Fourth";
        _controlerOption= _optionDController;
        break;
      default:
        backgroundColor = Colors.transparent;
        choicelabel = "default";
        _controlerOption= _optionAController;
        break;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          child: Text(
            answer,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: TextField(
            controller: _controlerOption,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)
                ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                ),
              ),
              labelText: '$choicelabel Answer',
              labelStyle: TextStyle(color: Colors.grey[700]),
            ),
            maxLines: null,
          ),
        ),
      ],
    );

    
  }
  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach(print);
    allQuestionsData = allRows;
    setState(() {});
  }

    void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.questiontitle: _questiontitleController.text,
      DatabaseHelper.optionA:_optionAController.text,
      DatabaseHelper.optionB:_optionBController.text,
      DatabaseHelper.optionC:_optionCController.text,
      DatabaseHelper.optionD:_optionDController.text,
      DatabaseHelper.correctChoice : _selectedAnswer,
      };
    print('insert stRT');
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    _questiontitleController.text = "";
    _optionAController.text = "";
    _optionBController.text = "";
    _optionCController.text = "";
    _optionDController.text = "";
    _correctChoiceController.text = "";
    _query();
  }
}
