import 'package:flutter/material.dart';

class StandardBackground extends StatelessWidget {
  const StandardBackground({super.key, this.component});
  final Widget? component;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: component,
    );
  }
}
