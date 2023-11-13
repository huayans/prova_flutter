// task_store.dart
import 'package:mobx/mobx.dart';

part 'task_store.g.dart';

class Task = _TaskBase with _$Task;

abstract class _TaskBase with Store {
  @observable
  String title;

  @observable
  bool completed;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }

  _TaskBase({required this.title, this.completed = false});
}
