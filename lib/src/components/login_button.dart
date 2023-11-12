import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color.fromRGBO(68, 189, 110, 1),
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Entrar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
