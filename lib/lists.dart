// ignore: camel_case_types
import 'package:flutter/material.dart';

class choice {
  String answer;
  bool isSelected;
  Color color;

  choice(this.answer, {this.isSelected = false, this.color = Colors.white});
}


class Quetion {
  String que = '';
  List<choice> elm = [];
  String cor_ans = '';
  Quetion(this.que, this.elm, this.cor_ans);
}

List<choice> ans = [
  choice('Tomatoes, biscuits, butter ',),
  choice('Chicken, fish, eggs'),
  choice('Cheese, milk, yoghurt'),
  choice('Potatoes, fish, cucumbers')
];
List<choice> ans1 = [
  choice('Tomatoes, biscuits'),
  choice('Chicken, fish'),
  choice('Cheese, milk'),
  choice('Potatoes, fish')
];

class ClassName extends ChangeNotifier {
  List<Quetion> name = [
    Quetion(
        'Which foods are important for the development of healthy, strong bones?',
        ans,
        'Tomatoes, biscuits, butter '),
    Quetion('Which foods are important for the development a strong bones?',
        ans1, 'Potatoes, fish'),
        
  ];

  List <Map<String, Object>> questions = [
    {
    'question': 'Which foods are important for the development of healthy, strong bones?',
    'options': ['Tomatoes, biscuits, butter ', 'Chicken, fish, eggs', 'Cheese, milk, yoghurt', 'Potatoes, fish, cucumbers'],
    'answer': 'Tomatoes, biscuits, butter '
  },
  {
    'question': 'Which foods are important for the development a strong bones?',
    'options': ['Tomatoes, biscuits', 'Chicken, fish', 'Cheese, milk', 'Potatoes, fish'],
    'answer': 'Potatoes, fish'
  }
  ];

  int i = 0;
  int k = 0;
//   void inc() {
//     // if (name.length-1 > i) {
   
//     // }
//      i++;
//     notifyListeners();
//   }

//  void dec() {
//   if (i!=-1 && name.length > i ) {
//     i--;
//   }
//     notifyListeners();
//   }


//   void tot(List<choice> elm,int y) {
//       for (var i = 0; i < 4; i++) {
//         if (elm[i].isans == true) {
//           if (elm[i].answer == name[y].cor_ans) {
//             k++;
//             elm[i].vals=Colors.green;
//           }else{
//             elm[i].vals=Colors.red;
//           }
//         }
//       }
//     notifyListeners();
//   }

//   void reset() {
//     i = 0;
//     k = 0;
//     for (var i = 0; i < name.length; i++) {
//      ans1[i].isans = false;
//       ans1[i].vals = Colors.white;
//     }
//     notifyListeners();
//   }




}
