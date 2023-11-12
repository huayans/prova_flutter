import 'package:flutter/material.dart';
import 'package:prava_flutter/src/components/button_web_view.dart';
import 'package:prava_flutter/src/components/starndard_background.dart';

class CaptureInformationPage extends StatefulWidget {
  const CaptureInformationPage({super.key});

  @override
  State<CaptureInformationPage> createState() => _CaptureInformationPageState();
}

class _CaptureInformationPageState extends State<CaptureInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StandardBackground(
        component: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              height: 500,
              child: Card(
                color: Colors.white,
                elevation: 4,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(5, 20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Título do Card'),
                      subtitle: Text('Subtítulo do Card'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.abc),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    ),
                  ],
                ),
              ),
            ),
            ButtonWebView(),
          ],
        ),
      ),
    );
  }
}
