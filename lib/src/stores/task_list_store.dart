// task_list_store.dart
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'task_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'task_list_store.g.dart';

class TaskListStore = _TaskListStoreBase with _$TaskListStore;

abstract class _TaskListStoreBase with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>();

  @action
  Future<void> addTask(String title) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks.add(
      Task(title: title),
    );

    List<Map<String, dynamic>> listJson =
        tasks.map((produto) => produto.toJson()).toList();
    String jsonString = jsonEncode(listJson);
    prefs.setString('list', jsonString);
  }

  @action
  void toggleTaskCompletion(Task task) {
    task.completed = !task.completed;
  }

  @action
  Future<void> editTask(String newValue, Task task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final index = tasks.indexWhere((amount) => amount.title == task.title);
    tasks[index] = Task(title: newValue);

    List<Map<String, dynamic>> listJson =
        tasks.map((produto) => produto.toJson()).toList();
    String jsonString = jsonEncode(listJson);
    prefs.setString('list', jsonString);
  }

  @action
  Future<void> removeTask(Task task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('list');
    tasks.remove(task);
  }

  void fillStory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? list = await prefs.getString('list');
    if (list != null) {
      List<Map<String, dynamic>> listJson = jsonDecode(list);
      tasks = ObservableList.of(
          listJson.map((e) => Task(title: e['title'])).toList());
    }
  }
}
