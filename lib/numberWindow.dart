import 'package:education_child_app/taskNumber.dart';
import 'package:flutter/material.dart';


class NumberWindow extends StatefulWidget {
  const NumberWindow({Key? key});

  @override
  State<NumberWindow> createState() => _NumberWindowtState();
}

class _NumberWindowtState extends State<NumberWindow> {
  final List<Task> tasks = TaskList.getTasks();

  int score = 0;
  int currentTaskIndex = 0;

  void checkAnswer(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
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
      appBar: AppBar(
        title: Text('Game'),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Баллы: $score',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Material(
            color: const Color(0xFFC71A4F),
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () {
                checkAnswer(tasks[currentTaskIndex].correct);
              },
              child: Column(
                children: [
                  Image.asset(
                    tasks[currentTaskIndex].image_correct,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(height: 5),
                  Text(
                    tasks[currentTaskIndex].text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}