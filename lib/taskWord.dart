class TaskWord {
  final String audioWord;
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
  final String correct_word1;
  final String correct_word2;
  final String correct_word3;
  final String correct_word4;
  final String correct_word5;
  final String correct_word6;
  final String correct_word7;
  final String correct_word8;
  final int correct_number;



  TaskWord({required this.audioWord, required this.word1, required this.word2, required this.word3, required this.word4,
    required this.word5,required this.word6, required this.word7, required this.word8, required this.text, required this.word,
    required this.correct_word1, required this.correct_word2, required this.correct_word3, required this.correct_word4,required this.correct_word5,required this.correct_word6,required this.correct_word7,required this.correct_word8, required this.correct_number});
}

class TaskList {
  static List<TaskWord> getTasks() {
    return [
      TaskWord(
        audioWord:'Sound/taskwordSound/ГЛАЗ.mp3',
        correct_number:4,
        word1: 'assets/Alphtablet/А.png',
        word2: 'assets/Alphtablet/Г.png',
        word3: 'assets/Alphtablet/З.png',
        word4: 'assets/Alphtablet/С.png',
        word5: 'assets/Alphtablet/М.png',
        word6: 'assets/Alphtablet/Я.png',
        word7: 'assets/Alphtablet/Л.png',
        word8: 'assets/Alphtablet/Ж.png',
        text: 'Что изображено на картинке?',
        word: "ГЛАЗ",
        correct_word1: "А",
        correct_word2: "Г",
        correct_word3: "З",
        correct_word4: "С",
        correct_word5: "М",
        correct_word6: "Я",
        correct_word7: "Л",
        correct_word8: "Ж",
      ),
      TaskWord(
        audioWord:'Sound/taskwordSound/РОТ.mp3',
        correct_number:3,
        word1: 'assets/Alphtablet/Ф.png',
        word2: 'assets/Alphtablet/Т.png',
        word3: 'assets/Alphtablet/Р.png',
        word4: 'assets/Alphtablet/С.png',
        word5: 'assets/Alphtablet/М.png',
        word6: 'assets/Alphtablet/О.png',
        word7: 'assets/Alphtablet/Л.png',
        word8: 'assets/Alphtablet/Ж.png',
        text: 'Что изображено на картинке?',
        word: "РОТ",
        correct_word1: "Ф",
        correct_word2: "Т",
        correct_word3: "Р",
        correct_word4: "С",
        correct_word5: "М",
        correct_word6: "О",
        correct_word7: "Л",
        correct_word8: "Ж",
      ),
      TaskWord(
        audioWord:'Sound/taskwordSound/КУЗНЕЦ.mp3',
        correct_number:6,
        word1: 'assets/Alphtablet/К.png',
        word2: 'assets/Alphtablet/Г.png',
        word3: 'assets/Alphtablet/З.png',
        word4: 'assets/Alphtablet/Е.png',
        word5: 'assets/Alphtablet/М.png',
        word6: 'assets/Alphtablet/Ц.png',
        word7: 'assets/Alphtablet/У.png',
        word8: 'assets/Alphtablet/Н.png',
        text: 'Что изображено на картинке?',
        word: "КУЗНЕЦ",
        correct_word1: "К",
        correct_word2: "Г",
        correct_word3: "З",
        correct_word4: "Е",
        correct_word5: "М",
        correct_word6: "Ц",
        correct_word7: "У",
        correct_word8: "Н",
      ),
    ];
  }
}
