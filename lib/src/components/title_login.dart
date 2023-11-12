import 'package:flutter/material.dart';

class TitleLogin extends StatelessWidget {
  const TitleLogin({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, bottom: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
