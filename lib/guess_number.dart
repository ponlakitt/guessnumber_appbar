// ignore_for_file: avoid_print

import 'dart:io';
import 'game.dart';

List<int> gameCount = [];
void main() {
  while (true) {
    playGame();
    String? input;
    do {
      stdout.write('Play again? (Y/N): ');
      input = stdin.readLineSync();
      print('                                         ');
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');

    if (input.toLowerCase() == 'n') {
      print("You've played "+(gameCount.length).toString()+" games");
      for (var i = 0; i < gameCount.length; i++) {
        print("💘 Game #"+(i+1).toString() +": "+gameCount[i].toString()+" guesses");
      }
      break;
    }
  }
  // จบโปรแกรม
}
void playGame() {
  stdout.write('Enter a maximum number to random: ');
  dynamic max = stdin.readLineSync();
  max = int.tryParse(max);
  var game = Game(maxRandom: max);
  var isCorrect = false;
  print('                                         ');
  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do{
    stdout.write('║ Guess the number between 1 and ' +(game.maxNum).toString() + ' : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }
    //guessCount++;
    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      print('║ ➜ $guess is CORRECT ❤, total guesses: ' +
          (game.guessCount).toString());
      print('╟────────────────────────────────────────');
      gameCount.add(game.guessCount);
      isCorrect = true;

    }
  } while (!isCorrect);
  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}