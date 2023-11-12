import 'package:flutter/material.dart';

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
      print('aqui vai navegar pra proxima tela');
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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(30, 78, 98, 1),
                Color.fromRGBO(45, 149, 142, 1)
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70, bottom: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Usuário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
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
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(33, 40, 57, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 70, bottom: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
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
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(33, 40, 57, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(68, 189, 110, 1),
                      ),
                    ),
                    onPressed: login,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/webViewContainer');
                    },
                    child: const Text(
                      'Política de Privacidade ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
