// lib/task_functions.dart
import 'dart:convert';
import 'dart:io';

class Task {
  final String name;
  final String details;
  final String dueDate;

  Task(this.name, this.details, this.dueDate);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'details': details,
      'dueDate': dueDate,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      json['name'],
      json['details'],
      json['dueDate'],
    );
  }
}

List<Task> tasks = [];

void addTask(String name, String details, String dueDate) {
  final task = Task(name, details, dueDate);
  tasks.add(task);
}

void viewTasks() {
  for (var i = 0; i < tasks.length; i++) {
    final task = tasks[i];
    print('$i. ${task.name} - Due Date: ${task.dueDate}');
  }
}

void viewTaskDescription(int index) {
  if (index >= 0 && index < tasks.length) {
    final task = tasks[index];
    print('Name: ${task.name}');
    print('Details: ${task.details}');
    print('Due Date: ${task.dueDate}');
  } else {
    print('Invalid task index.');
  }
}

void updateTask(int index, String name, String details, String dueDate) {
  if (index >= 0 && index < tasks.length) {
    final task = Task(name, details, dueDate);
    tasks[index] = task;
    print('Task updated successfully.');
  } else {
    print('Invalid task index.');
  }
}

void deleteTask(int index) {
  if (index >= 0 && index < tasks.length) {
    tasks.removeAt(index);
    print('Task deleted successfully.');
  } else {
    print('Invalid task index.');
  }
}

void saveTasksToFile(String filePath) {
  final jsonTasks = tasks.map((task) => task.toJson()).toList();
  final jsonString = jsonEncode(jsonTasks);
  File(filePath).writeAsStringSync(jsonString);
  print('Tasks saved to file.');
}

void loadTasksFromFile(String filePath) {
  try {
    final jsonString = File(filePath).readAsStringSync();
    final jsonTasks = jsonDecode(jsonString) as List<dynamic>;
    tasks = jsonTasks.map((jsonTask) => Task.fromJson(jsonTask)).toList();
    print('Tasks loaded from file.');
  } catch (e) {
    print('Error loading tasks from file: $e');
  }
}
