class Task {
  final String image_correct;
  final String image_uncorrect;
  final String image_uncorrect1;
  final String text;
  final bool correct;

  Task({required this.image_correct, required this.image_uncorrect, required this.image_uncorrect1, required this.text, required this.correct});
}

class TaskList {
  static List<Task> getTasks() {
    return [
      Task(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Что изображено на картинке?',
        correct: true,
      ),
      Task(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Что за город?',
        correct: false,
      ),
      Task(
        image_correct: 'assets/image1.jpg',
        image_uncorrect: 'assets/image1.jpg',
        image_uncorrect1: 'assets/image1.jpg',
        text: 'Как называется животное?',
        correct: true,
      ),
    ];
  }
}