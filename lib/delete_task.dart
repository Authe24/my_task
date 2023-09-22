import 'dart:io';

import 'error_task.dart';

class App {
  // ...

  void deleteRectangle(int id) {
    final rectangleIndex = rectangles.indexWhere((rect) => rect.id == id);
    if (rectangleIndex != -1) {
      print('Rectangle deleted: ID=${rectangles[rectangleIndex].id}');
      rectangles.removeAt(rectangleIndex);
    } else {
      print('Rectangle not found');
    }
  }

  // ...

  void run() {
    // ...
    switch (choice) {
      // ...

      case 4:
        stdout.write('Enter ID of the rectangle to delete: ');
        final id = int.tryParse(stdin.readLineSync());

        if (id != null) {
          deleteRectangle(id);
        } else {
          handleError('Invalid ID');
        }
        break;
      // ...
    }
  }
}

// ...
