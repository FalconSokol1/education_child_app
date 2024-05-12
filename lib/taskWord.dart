class TaskWord {
  final String image_correct;
  final String image_uncorrect;
  final String image_uncorrect1;
  final String text;
  final bool correct;

  TaskWord({required this.image_correct, required this.image_uncorrect, required this.image_uncorrect1, required this.text, required this.correct});
}

class TaskList {
  static List<TaskWord> getTasks() {
    return [
      TaskWord(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Что изображено на картинке?',
        correct: true,
      ),
      TaskWord(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Что за город?',
        correct: false,
      ),
      TaskWord(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Как называется животное?',
        correct: true,
      ),
    ];
  }
}