// ignore_for_file: avoid_print

import 'dart:math';
import 'dart:io';

class Game { // camel case
  int? _answer ;
  int _guessCount = 0;
  int? max;
  Game({int? maxRandom}){
    maxRandom ??= 100;
    max = maxRandom ;
    _answer = Random().nextInt(max!) + 1 ;
  }
  int get guessCount {
    return _guessCount;
  }
  int? get maxNum{
    return max;
  }
  int doGuess(int num){
    // ทายถูก return 0
    // ทายมากไป return 1
    // ทายน้อยไป return -1
    _guessCount++;
    if(num > _answer!){
      return 1 ;
    }else if (num < _answer!){
      return -1 ;
    }else {
      return 0 ;
    }
  }
}