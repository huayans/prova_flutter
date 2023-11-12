import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prava_flutter/src/components/button_web_view.dart';
import 'package:prava_flutter/src/components/login_button.dart';
import 'package:prava_flutter/src/components/starndard_background.dart';
import 'package:prava_flutter/src/components/title_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    if (username.isNotEmpty && password.isNotEmpty) {
      print(' Usuário: $username, Senha: $password');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro de Login'),
          content: const Text(
              'Por favor, preencha ambos os campos de login e senha.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushNamed('/captureInformation');
    }
  }

  bool _isValidPassword(String password) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: StandardBackground(
          component: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleLogin(title: "Usuário"),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    maxLength: 20,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite um usuário.';
                      } else if (value.endsWith(' ')) {
                        return 'O usuário não pode terminar com um espaço.';
                      } else if (value.length > 20) {
                        return 'O usuário deve ser menor que 20 caracteres.';
                      }
                      return null;
                    },
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      counter: SizedBox.shrink(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        FontAwesomeIcons.userLarge,
                        color: Color.fromRGBO(33, 40, 57, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const TitleLogin(title: "Senha"),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    maxLength: 20,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, digite uma senha.';
                      } else if (value.length < 2 || value.length > 20) {
                        return 'A senha deve ter entre 2 e 20 caracteres.';
                      } else if (value.endsWith(' ')) {
                        return 'A senha não pode terminar com um espaço.';
                      } else if (!_isValidPassword(value)) {
                        return 'A senha só pode conter letras (a-Z) e números (0-9).';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      counter: SizedBox.shrink(),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        color: Color.fromRGBO(33, 40, 57, 1),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                LoginButton(onPressed: login),
                const ButtonWebView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
