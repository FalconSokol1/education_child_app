import 'package:education_child_app/taskNumber.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class NumberWindow extends StatefulWidget {
  const NumberWindow({Key? key});

  @override
  State<NumberWindow> createState() => _NumberWindowtState();

}


class _NumberWindowtState extends State<NumberWindow> {
  late bool _isVisible = false;
  final List<Task> tasks = TaskList.getTasks();

  int score = 0;
  int currentTaskIndex = 0;

  @override
  void initState() {
    super.initState();

    // Установим начальное значение видимости текста как false
    _isVisible = false;

    // Установим задержку перед началом анимации
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  void checkAnswer(String isCorrect) {
    if (tasks[currentTaskIndex].btn_correct == isCorrect) {
      setState(() {
        score++;
      });
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _isVisible = true;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Ответ неправильный'),
      ));
    }

    if (currentTaskIndex < tasks.length - 1) {
      setState(() {
        currentTaskIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Игра окончена'),
          content: Text('Ваши баллы: $score'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  score = 0;
                  currentTaskIndex = 0;
                });
              },
              child: Text('Начать заново'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child:Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 160,
                    width: 450,
                    child:
                    Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 390,
                            decoration: BoxDecoration(
                              color: const Color(0xFFC71A4F),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 5,
                                  spreadRadius: 3,
                                  color: const Color(0xFFC71A4F).withOpacity(.4),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedOpacity(
                                opacity: _isVisible ? 1.0 : 0.0,
                                duration: Duration(seconds: 1),
                                child: Text(
                                  tasks[currentTaskIndex].text, textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                'Баллы: $score',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ) ,]
                    )
                ),
            ],),
            SizedBox(
              height: 140,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 125,
                      width: 390,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Stack(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Material(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    String btn = "btn1";
                                    checkAnswer(btn);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        tasks[currentTaskIndex].image_correct,
                                        width: 100,
                                        height: 125,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    String btn = "btn2";
                                    checkAnswer(btn);

                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        tasks[currentTaskIndex].image_correct,
                                        width: 100,
                                        height: 125,
                                        fit: BoxFit.fill,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Material(
                                borderRadius: BorderRadius.circular(20),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: InkWell(
                                  splashColor: Colors.grey,
                                  onTap: () {
                                    String btn = "btn3";
                                    checkAnswer(btn);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          tasks[currentTaskIndex].image_correct,
                                          width: 100,
                                          height: 125,
                                          fit: BoxFit.fill
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,),
            FloatingActionButton(
              heroTag: null,
              foregroundColor:  Colors.white,// <-- Text
              backgroundColor: const Color(0xFFC71A4F),
              child:Icon( // <-- Icon
                Icons.arrow_back,
                size: 24.0,
              ),
              onPressed: () {Navigator.pop(context);},
            ),
          ],
        ),
      )

    );
  }
}