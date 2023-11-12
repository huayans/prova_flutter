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
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.elliptical(5, 20),
                ),
              ),
              margin: const EdgeInsets.all(16.0),
              height: 350,
              width: 350,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              'Texto Digitado 1',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            size: 50,
                            color: Color.fromRGBO(8, 8, 8, 1),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.cancel,
                            size: 50,
                            color: Color.fromRGBO(203, 54, 56, 1),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(),
                    )
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              width: 300,
              child: TextFormField(
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
            const ButtonWebView(),
          ],
        ),
      ),
    );
  }
}
