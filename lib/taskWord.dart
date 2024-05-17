class TaskWord {
  final String word1;
  final String word2;
  final String word3;
  final String word4;
  final String word5;
  final String word6;
  final String word7;
  final String word8;
  final String text;
  final String word;
  final int correct_number;

  TaskWord({required this.word1, required this.word2, required this.word3, required this.word4, required this.word5,required this.word6, required this.word7, required this.word8, required this.text, required this.word, required this.correct_number});
}

class TaskList {
  static List<TaskWord> getTasks() {
    return [
      TaskWord(
        word1: 'assets/image1.jpg',
        word2: 'assets/image1.jpg',
        word3: 'assets/image1.jpg',
        word4: 'assets/image1.jpg',
        word5: 'assets/image1.jpg',
        word6: 'assets/image1.jpg',
        word7: 'assets/image1.jpg',
        word8: 'assets/image1.jpg',
        text: 'Что изображено на картинке?',
        word: "глаз",
        correct_number: 4,
      ),
      TaskWord(
        word1: 'assets/image1.jpg',
        word2: 'assets/image1.jpg',
        word3: 'assets/image1.jpg',
        word4: 'assets/image1.jpg',
        word5: 'assets/image1.jpg',
        word6: 'assets/image1.jpg',
        word7: 'assets/image1.jpg',
        word8: 'assets/image1.jpg',
        text: 'Что изображено на картинке?',
        word: "рот",
        correct_number: 3,
      ),
      TaskWord(
        word1: 'assets/image1.jpg',
        word2: 'assets/image1.jpg',
        word3: 'assets/image1.jpg',
        word4: 'assets/image1.jpg',
        word5: 'assets/image1.jpg',
        word6: 'assets/image1.jpg',
        word7: 'assets/image1.jpg',
        word8: 'assets/image1.jpg',
        text: 'Что изображено на картинке?',
        word: "кузнец",
        correct_number: 6,
      ),
    ];
  }
}