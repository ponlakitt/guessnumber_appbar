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
        print("๐ Game #"+(i+1).toString() +": "+gameCount[i].toString()+" guesses");
      }
      break;
    }
  }
  // เธเธเนเธเธฃเนเธเธฃเธก
}
void playGame() {
  stdout.write('Enter a maximum number to random: ');
  dynamic max = stdin.readLineSync();
  max = int.tryParse(max);
  var game = Game(maxRandom: max);
  var isCorrect = false;
  print('                                         ');
  print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');
  print('โ            GUESS THE NUMBER            ');
  print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');

  do{
    stdout.write('โ Guess the number between 1 and ' +(game.maxNum).toString() + ' : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }
    //guessCount++;
    var result = game.doGuess(guess);
    if (result == 1) {
      print('โ โ $guess is TOO HIGH! โฒ');
      print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');
    } else if (result == -1) {
      print('โ โ $guess is TOO LOW! โผ');
      print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');
    } else {
      print('โ โ $guess is CORRECT โค, total guesses: ' +
          (game.guessCount).toString());
      print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');
      gameCount.add(game.guessCount);
      isCorrect = true;

    }
  } while (!isCorrect);
  print('โ                 THE END                ');
  print('โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ');
}