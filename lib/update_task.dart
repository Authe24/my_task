import 'dart:io';

import 'error_task.dart';

void updateRectangle(int id, double newLength, double newWidth) {
  final rectangle =
      rectangles.firstWhere((rect) => rect.id == id, orElse: () => null);
  if (rectangle != null) {
    rectangle.length = newLength;
    rectangle.width = newWidth;
    print(
        'Rectangle updated: Length=${rectangle.length}, Width=${rectangle.width}');
  } else {
    print('Rectangle not found');
  }

  // ...

  void run() {
    // ...
    switch (rectangle) {
      // ...

      case 2:
        stdout.write('Enter ID of the rectangle to update: ');
        final id = int.tryParse(stdin.readLineSync());

        if (id != null) {
          stdout.write('Enter new length of the rectangle: ');
          final newLength = double.tryParse(stdin.readLineSync());
          stdout.write('Enter new width of the rectangle: ');
          final newWidth = double.tryParse(stdin.readLineSync());

          if (newLength != null && newWidth != null) {
            updateRectangle(id, newLength, newWidth);
          } else {
            handleError('Invalid input');
          }
        } else {
          handleError('Invalid ID');
        }
        break;
      // ...
    }
  }
}

// ...
