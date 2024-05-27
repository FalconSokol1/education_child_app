class Task {
  final String image_1;
  final String image_2;
  final String image_3;
  final String text;
  final String btn_correct;

  Task({required this.image_1, required this.image_2, required this.image_3, required this.text, required this.btn_correct});
}

class TaskList {
  static List<Task> getTasks() {
    return [
      Task(
        image_1: 'assets/gameNumber/1.jpg',
        image_2: 'assets/gameNumber/3.jpg',
        image_3: 'assets/gameNumber/9.jpg',
        text: 'На какой карточке цифра один?',
        btn_correct: "btn1"
      ),
      Task(
        image_1: 'assets/gameNumber/4.jpg',
        image_2: 'assets/gameNumber/2.jpg',
        image_3: 'assets/gameNumber/7.jpg',
        text: 'На какой карточке цифра два?',
        btn_correct: "btn2",
      ),
      Task(
        image_1: 'assets/gameNumber/3.jpg',
        image_2: 'assets/gameNumber/4.jpg',
        image_3: 'assets/gameNumber/5.jpg',
        text: 'На какой карточке цифра три?',
        btn_correct: "btn1",
      ),
      Task(
        image_1: 'assets/gameNumber/7.jpg',
        image_2: 'assets/gameNumber/6.jpg',
        image_3: 'assets/gameNumber/4.jpg',
        text: 'На какой карточке цифра четыре?',
        btn_correct: "btn3",
      ),
      Task(
        image_1: 'assets/gameNumber/5.jpg',
        image_2: 'assets/gameNumber/6.jpg',
        image_3: 'assets/gameNumber/7.jpg',
        text: 'На какой карточке цифра пять?',
        btn_correct: "btn1",
      ),
      Task(
        image_1: 'assets/gameNumber/7.jpg',
        image_2: 'assets/gameNumber/6.jpg',
        image_3: 'assets/gameNumber/8.jpg',
        text: 'На какой карточке цифра шесть?',
        btn_correct: "btn2",
      ),
      Task(
        image_1: 'assets/gameNumber/9.jpg',
        image_2: 'assets/gameNumber/7.jpg',
        image_3: 'assets/gameNumber/8.jpg',
        text: 'На какой карточке цифра семь?',
        btn_correct: "btn2",
      ),
      Task(
        image_1: 'assets/gameNumber/8.jpg',
        image_2: 'assets/gameNumber/9.jpg',
        image_3: 'assets/gameNumber/0.jpg',
        text: 'На какой карточке цифра восемь?',
        btn_correct: "btn1",
      ),
      Task(
        image_1: 'assets/gameNumber/9.jpg',
        image_2: 'assets/gameNumber/0.jpg',
        image_3: 'assets/gameNumber/5.jpg',
        text: 'На какой карточке цифра девять?',
        btn_correct: "btn1",
      ),
      Task(
        image_1: 'assets/gameNumber/0.jpg',
        image_2: 'assets/gameNumber/1.jpg',
        image_3: 'assets/gameNumber/3.jpg',
        text: 'На какой карточке цифра ноль?',
        btn_correct: "btn1",
      ),
    ];
  }
}