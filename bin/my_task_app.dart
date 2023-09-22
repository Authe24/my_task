import 'package:my_task_app/create_task.dart';
import 'package:my_task_app/delete_task.dart';
import 'package:my_task_app/new_list.dart';
import 'package:my_task_app/update_task.dart';
import 'package:my_task_app/error_task.dart';

import 'dart:math';
import 'dart:io';

// void main() {
void main() {
  final app = App();

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
      app.handleError('Invalid choice');
      continue;
    }

    if (choice == 5) {
      break;
    }

    switch (choice) {
      case 1:
        stdout.write('Enter length of the rectangle: ');
        final length = double.tryParse(stdin.readLineSync());
        stdout.write('Enter width of the rectangle: ');
        final width = double.tryParse(stdin.readLineSync());

        if (length != null && width != null) {
          app.createRectangle(length, width);
        } else {
          app.handleError('Invalid input');
        }
        break;

      case 2:
        stdout.write('Enter ID of the rectangle to update: ');
        final id = int.tryParse(stdin.readLineSync());

        if (id != null) {
          stdout.write('Enter new length of the rectangle: ');
          final newLength = double.tryParse(stdin.readLineSync());
          stdout.write('Enter new width of the rectangle: ');
          final newWidth = double.tryParse(stdin.readLineSync());

          if (newLength != null && newWidth != null) {
            app.updateRectangle(id, newLength, newWidth);
          } else {
            app.handleError('Invalid input');
          }
        } else {
          app.handleError('Invalid ID');
        }
        break;

      case 3:
        app.listRectangles();
        break;

      case 4:
        stdout.write('Enter ID of the rectangle to delete: ');
        final id = int.tryParse(stdin.readLineSync());

        if (id != null) {
          app.deleteRectangle(id);
        } else {
          app.handleError('Invalid ID');
        }
        break;
    }
  }
}
