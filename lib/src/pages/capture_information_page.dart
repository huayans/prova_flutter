import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prava_flutter/src/components/button_web_view.dart';
import 'package:prava_flutter/src/components/starndard_background.dart';
import 'package:prava_flutter/src/stores/task_list_store.dart';

class CaptureInformationPage extends StatefulWidget {
  const CaptureInformationPage({super.key});

  @override
  State<CaptureInformationPage> createState() => _CaptureInformationPageState();
}

class _CaptureInformationPageState extends State<CaptureInformationPage> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  final taskListStore = TaskListStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StandardBackground(
        component: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(5, 20),
                ),
              ),
              margin: const EdgeInsets.only(top: 80, right: 30, left: 30),
              child: SingleChildScrollView(
                child: Expanded(
                  child: Center(
                    child: Observer(
                      builder: (_) {
                        return SizedBox(
                          height: 300,
                          width: 350,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: taskListStore.tasks.length,
                            itemBuilder: (context, index) {
                              final task = taskListStore.tasks[index];
                              return ListTile(
                                title: SizedBox(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Wrap(
                                        children: [
                                          Text(
                                            task.title,
                                            style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              taskListStore.editTask(
                                                  myController.text, task);
                                            },
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 50,
                                              color: Color.fromRGBO(8, 8, 8, 1),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                  title: const Text('Aviso'),
                                                  content: const Text(
                                                      'Tem certeza que deseja apagar ?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        taskListStore
                                                            .removeTask(task);
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Sim'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text('Não'),
                                                    )
                                                  ],
                                                ),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.cancel,
                                              size: 50,
                                              color: Color.fromRGBO(
                                                  203, 54, 56, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 300,
              child: Form(
                key: _formKey,
                child: TextFormField(
                  /* onChanged: () {}, */
                  onEditingComplete: () {},
                  controller: myController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo em branco. ';
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      taskListStore.addTask(value);
                    }
                  },
                  autofocus: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 70),
                    border: InputBorder.none,
                    hintText: 'Digite seu texto',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(7, 7, 7, 1),
                    ),
                  ),
                ),
              ),
            ),
            const ButtonWebView(),
          ],
        ),
      ),
    );
  }
}
