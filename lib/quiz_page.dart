import 'package:flutter/material.dart';
import 'package:quiz/main.dart';

class Choice {
  String answer;
  bool isSelected;

  Choice(this.answer, {this.isSelected = false});
}

List<Map<String, Object>> questions = [
  {
    'question': 'What is the primary purpose of a compiler?',
    'options': [
      Choice('Execute code directly'),
      Choice('Translate source code to machine code'),
      Choice('Debug programs'),
      Choice('Manage memory allocation')
    ],
    'answer': 'Translate source code to machine code'
  },
  {
    'question': 'Which data structure uses LIFO (Last In, First Out) principle?',
    'options': [
      Choice('Queue'),
      Choice('Stack'),
      Choice('Array'),
      Choice('Linked List')
    ],
    'answer': 'Stack'
  },
  {
    'question': 'What does HTML stand for?',
    'options': [
      Choice('HyperText Markup Language'),
      Choice('HighText Machine Language'),
      Choice('Hyperlink and Text Markup Language'),
      Choice('HyperText Multi Language')
    ],
    'answer': 'HyperText Markup Language'
  },
  {
    'question': 'Which of the following is a programming language?',
    'options': [
      Choice('HTML'),
      Choice('CSS'),
      Choice('Python'),
      Choice('SQL')
    ],
    'answer': 'Python'
  },
  {
    'question': 'What is the time complexity of accessing an element in an array?',
    'options': [
      Choice('O(n)'),
      Choice('O(log n)'),
      Choice('O(1)'),
      Choice('O(n^2)')
    ],
    'answer': 'O(1)'
  },
  {
    'question': 'Which algorithm is used for sorting data?',
    'options': [
      Choice('Dijkstra’s algorithm'),
      Choice('Merge sort'),
      Choice('Depth-first search'),
      Choice('Binary search')
    ],
    'answer': 'Merge sort'
  },
  {
    'question': 'What does API stand for?',
    'options': [
      Choice('Application Programming Interface'),
      Choice('Application Program Integration'),
      Choice('Advanced Programming Interface'),
      Choice('Application Protocol Interface')
    ],
    'answer': 'Application Programming Interface'
  },
  {
    'question': 'In object-oriented programming, what is inheritance?',
    'options': [
      Choice('A way to create new classes from existing ones'),
      Choice('A method to hide data'),
      Choice('A technique to optimize code execution'),
      Choice('A way to handle exceptions')
    ],
    'answer': 'A way to create new classes from existing ones'
  },
  {
    'question': 'What is the main function in a C program?',
    'options': [
      Choice('main()'),
      Choice('start()'),
      Choice('execute()'),
      Choice('run()')
    ],
    'answer': 'main()'
  },
  {
    'question': 'Which of the following is a version control system?',
    'options': [
      Choice('Git'),
      Choice('Docker'),
      Choice('Kubernetes'),
      Choice('Jenkins')
    ],
    'answer': 'Git'
  }
];


class MyQuizApp extends StatefulWidget {
  @override
  _MyQuizAppState createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  PageController _pageController = PageController();
  int currentQuestionIndex = 0;
  int results = 0;
  Map selected = {};

  void tot(String elm) {
    selected[currentQuestionIndex] = elm;
  }

  void rel(Map selected){
   selected.forEach((key, value) {
     if(value==questions[key]['answer']){
      results++;
     }
   },);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: questions.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, i) {
          List<Choice> options = questions[i]['options'] as List<Choice>;

          return Container(
            color: Color.fromARGB(255, 13, 48, 77),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lifeskill Quiz',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Quetion ${i + 1}/${questions.length}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    questions[i]['question'].toString(),
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                for (var option in options) {
                                  option.isSelected = false; // Uncheck all
                                }
                                options[index].isSelected =
                                    true; // Check current selection
                              });
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.black,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      options[index].answer,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    Checkbox(
                                      checkColor:
                                          Color.fromARGB(255, 231, 238, 232),
                                      activeColor:
                                          Color.fromARGB(255, 53, 221, 19),
                                      shape: const CircleBorder(),
                                      value: options[index].isSelected,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          for (var option in options) {
                                            option.isSelected =
                                                false; // Uncheck all
                                          }
                                          options[index].isSelected =
                                              newValue ?? false;

                                          // Check current selection
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentQuestionIndex > 0)
                        ElevatedButton(
                          onPressed: () {
                            if (currentQuestionIndex > 0) {
                              _pageController.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: Text("Back"),
                        ),
                      ElevatedButton(
                        onPressed: () {
                          String ele = options
                              .firstWhere((option) => option.isSelected)
                              .answer;
                          tot(ele); // Check if the selected answer is correct
                          if (currentQuestionIndex < questions.length - 1) {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          } else {
                            setState(() {
                            rel(selected);
                  
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text("Quiz Completed"),
                                content: Text(
                                    "Thank you for completing the quiz! resuly will be ${results}/${questions.length}"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      // Optionally reset the quiz
                                      setState(() {
                                        currentQuestionIndex = 0;
                                        results = 0;
                                        selected.clear();
                                        for (var question in questions) {
                                          for (var option
                                              in question['options'] as List) {
                                            (option as Choice).isSelected =
                                                false;
                                          }
                                        }
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyHomePage()));
                                    },
                                    child: Text("Try again"),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: Text(currentQuestionIndex < questions.length - 1
                            ? "Next"
                            : "Finish"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            currentQuestionIndex = index;
          });
        },
      ),
    );
  }
}
