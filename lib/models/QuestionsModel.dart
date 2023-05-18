
class Question {
   int id;
   String questiontitle;
   String optionA;
   String optionB;
   String optionC;
   String optionD;
   String correctChoice;

  Question.formDBMap(Map<String, dynamic> map)
    : id = map['id'],
    questiontitle = map['questiontitle'],
    optionA = map['optionA'],
    optionB = map['optionB'],
    optionC = map['optionC'],
    optionD = map['optionD'],
    correctChoice = map['correctChoice'];

    Map<String, dynamic> toDbMap(){
      var map = Map<String, dynamic>();
      map['columnId'] = id;
      map['questiontitle'] = questiontitle;
      map['optionA'] = optionA;
      map['optionB'] = optionB;
      map['optionC'] = optionC;
      map['optionD'] = optionD;
      map['correctChoice'] = correctChoice;

      return map;
    }

  
}

