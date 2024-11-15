import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.cyan,
    Colors.yellow,
    Colors.pink,
    Colors.orangeAccent,
    Colors.purpleAccent,
  ];

  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
}

// class NumberStream {
//   final StreamController<int> controller = StreamController<int>();
//   void addNumberToSink(int newNumber) {
//     controller.sink.add(newNumber);
//   }
// }
class NumberStream {
  Stream<int> getNumbers() async* {
    {
      yield* Stream.periodic(const Duration(seconds: 1), (int t) {
        Random random = Random();
        int myNum = random.nextInt(10);
        return myNum;
      });
    }
  }
}

  // addError() {
  //   controller.sink.addError('error');
  // }

  // close() {
  //   controller.close();
  // }
