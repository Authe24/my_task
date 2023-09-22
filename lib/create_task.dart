import 'dart:io';
import 'dart:math';

import 'error_task.dart';

class Rectangle {
  double length;
  double width;

  Rectangle(this.length, this.width);

  double calculateArea() {
    return length * width;
  }
}

class App {
  List<Rectangle> rectangles = [];
  int _nextId = 1;

  void createRectangle(double length, double width) {
    Rectangle newRectangle = Rectangle(length, width);
    rectangles.add(newRectangle);
    print(
        'Rectangle created: Length=${newRectangle.length}, Width=${newRectangle.width}');
  }

  void run() {
    switch (Rectangle) {
      case 1:
        stdout.write(5.0);
        final length = double.tryParse(stdin.readLineSync());
        stdout.write('Enter width of the rectangle: ');
        final width = double.tryParse(stdin.readLineSync());

        if (length != null && width != null) {
          createRectangle(length, width);
        } else {
          handleError('Invalid input');
        }
        break;
    }
  }
}

void main() {
  final app = App();
  app.run();
}
