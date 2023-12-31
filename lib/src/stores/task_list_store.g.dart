// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListStore on _TaskListStoreBase, Store {
  late final _$tasksAtom =
      Atom(name: '_TaskListStoreBase.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$_TaskListStoreBaseActionController =
      ActionController(name: '_TaskListStoreBase', context: context);

  @override
  Future<void> addTask(String title) {
    final _$actionInfo = _$_TaskListStoreBaseActionController.startAction(
        name: '_TaskListStoreBase.addTask');
    try {
      return super.addTask(title);
    } finally {
      _$_TaskListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTaskCompletion(Task task) {
    final _$actionInfo = _$_TaskListStoreBaseActionController.startAction(
        name: '_TaskListStoreBase.toggleTaskCompletion');
    try {
      return super.toggleTaskCompletion(task);
    } finally {
      _$_TaskListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> editTask(String newValue, Task task) {
    final _$actionInfo = _$_TaskListStoreBaseActionController.startAction(
        name: '_TaskListStoreBase.editTask');
    try {
      return super.editTask(newValue, task);
    } finally {
      _$_TaskListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> removeTask(Task task) {
    final _$actionInfo = _$_TaskListStoreBaseActionController.startAction(
        name: '_TaskListStoreBase.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TaskListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
