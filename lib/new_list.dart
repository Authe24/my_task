import 'dart:math';

void listRectangles() {
  if (rectangles.isEmpty) {
    print('No rectangles found');
  } else {
    print('Rectangles:');
    for (var rectangle in rectangles) {
      print(
          'ID: ${rectangle.id}, Length: ${rectangle.length}, Width: ${rectangle.width}');
    }
  }

  // ...

  void run() {
    // ...
    switch (Rectangle) {
      // ...

      case 3:
        listRectangles();
        break;
      // ...
    }
  }
}

// ...
