import 'package:flutter/material.dart';

class StylePage extends StatefulWidget {
  const StylePage({super.key});

  @override
  State<StylePage> createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  var mainColor = const Color.fromARGB(255, 11, 54, 78);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: mainColor,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text("Estilos"),
            ),
          ],
        ),
      ),
    );
  }
}
