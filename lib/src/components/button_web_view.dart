import 'package:flutter/material.dart';

class ButtonWebView extends StatelessWidget {
  const ButtonWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
