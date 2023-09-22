import 'dart:io';
import 'package:my_task_app/class_functions.dart';

void main() {
  while (true) {
    print(
        'Available commands: add, view, view <index>, update <index>, delete <index>, save, load, exit');
    final input = stdin.readLineSync();

    if (input == null) {
      // Handle null input gracefully, e.g., by printing an error message and continuing the loop.
      print('Invalid input. Please try again.');
      continue;
    }

    final parts = input.split(' ');
    final command = parts[0];

    switch (command) {
      case 'add':
        try {
          // Prompt the user for task information
          print('Enter task name:');
          final name = stdin.readLineSync();
          if (name == null || name.isEmpty) {
            throw Exception('Task name cannot be empty.');
          }

          print('Enter task details:');
          final details = stdin.readLineSync();
          if (details == null || details.isEmpty) {
            throw Exception('Task details cannot be empty.');
          }

          print('Enter task due date (integer):');
          final dueDateInput = stdin.readLineSync();
          int dueDate;
          try {
            dueDate = int.parse(dueDateInput!);
          } catch (e) {
            throw Exception(
                'Invalid due date format. Please enter an integer.');
          }

          addTask(name, details,
              dueDate.toString()); // Convert dueDate to string for consistency
          print('Task added successfully.');
        } catch (e) {
          print('Error: ${e.toString()}');
        }
        break;
      case 'view':
        if (parts.length == 1) {
          viewTasks();
        } else if (parts.length == 2) {
          final index = int.tryParse(parts[1]);
          viewTaskDescription(index!);
        } else {
          print('Usage: view or view <index>');
        }
        break;
      case 'update':
        if (parts.length < 5) {
          print('Usage: update <index> <name> <details> <dueDate>');
        } else {
          final index = int.tryParse(parts[1]);
          final name = parts[2];
          final details = parts[3];
          final dueDate = parts[4];
          try {
            updateTask(index!, name, details, dueDate);
          } catch (e) {
            print('Error: ${e.toString()}');
          }
        }
        break;
      case 'delete':
        if (parts.length == 2) {
          final index = int.tryParse(parts[1]);
          try {
            deleteTask(index!);
          } catch (e) {
            print('Error: ${e.toString()}');
          }
        } else {
          print('Usage: delete <index>');
        }
        break;
      case 'save':
        saveTasksToFile('tasks.json');
        break;
      case 'load':
        loadTasksFromFile('tasks.json');
        break;
      default:
        print('Invalid command. Please try again.');
        break;
    }
  }
}
