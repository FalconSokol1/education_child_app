class NumberCard {
  final String text;
  final String number;
  final String sound;
  final int correct_number;

  NumberCard({required this.text, required this.number, required this.sound, required this.correct_number});
}
class WordList {
  static List<NumberCard> getNumber() {
    return [
      NumberCard(
      number: 'assets/gameNumber/1.jpg',
      text: 'Один',
      sound: 'Sound/lernnumberSound/numbrerOne.mp3',
      correct_number: 1,
    ),
      NumberCard(
        number: 'assets/gameNumber/2.jpg',
    text: 'Два',
    sound: 'Sound/lernnumberSound/numberTwo.mp3',
    correct_number: 2,
    ),
      NumberCard(
        number: 'assets/gameNumber/3.jpg',
    text: 'Три',
    sound: 'Sound/lernnumberSound/numberThree.mp3',
    correct_number: 3,
    ),
      NumberCard(
        number: 'assets/gameNumber/4.jpg',
    text: 'Гном',
    sound: 'Sound/lernnumberSound/numberFour.mp3',
    correct_number: 4,
    ),
      NumberCard(
        number: 'assets/gameNumber/5.jpg',
    text: 'Пять',
    sound: 'Sound/lernnumberSound/numberFive.mp3',
    correct_number: 5,
    ),
      NumberCard(
        number: 'assets/gameNumber/6.jpg',
    text: 'Шесть',
    sound: 'Sound/lernnumberSound/numberSix.mp3',
    correct_number: 6,
    ),
      NumberCard(
        number: 'assets/gameNumber/7.jpg',
    text: 'Семь',
    sound: 'Sound/lernnumberSound/numberSeven.mp3',
    correct_number: 7,
    ),
      NumberCard(
        number: 'assets/gameNumber/8.jpg',
    text: 'Восемь',
    sound: 'Sound/lernnumberSound/numberEight.mp3',
    correct_number: 8,
    ),
      NumberCard(
        number: 'assets/gameNumber/9.jpg',
    text: 'Девять',
    sound: 'Sound/lernnumberSound/numberNine.mp3',
    correct_number: 9,
    ),
      NumberCard(
        number: 'assets/gameNumber/0.jpg',
    text: 'Ноль',
    sound: 'Sound/lernnumberSound/numberZero.mp3',
    correct_number: 0,
    ),
    ];
  }
}