import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/lists.dart';
import 'package:quiz/pages.dart';

import 'package:quiz/quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ClassName(),
      child: MaterialApp(
        title: 'Flutter Demo',
      
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromARGB(255, 13, 48, 77),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('asset/image/q.png'),fit: BoxFit.cover)),
            ),
            Text(
              'Quiz App',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
             SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MyQuizApp()),
              );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [Colors.white,Colors.white])),
                        child: Text(
                          'START',
                          style: TextStyle(
                              color: Color.fromARGB(255, 13, 48, 77),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
