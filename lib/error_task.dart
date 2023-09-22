void handleError(String message) {
  print('Error: $message');
}

void run() {
  while (true) {
    print('Options:');
    print('1. Add Rectangle');
    print('2. Update Rectangle');
    print('3. List Rectangles');
    print('4. Delete Rectangle');
    print('5. Exit');
    stdout.write('Enter your choice: ');

    final choice = int.tryParse(stdin.readLineSync());

    if (choice == null || choice < 1 || choice > 5) {
      handleError('Invalid choice');
      continue;
    }

    if (choice == 5) {
      break;
    }

    switch (choice) {
      // ...
    }
  }
}


// ...
