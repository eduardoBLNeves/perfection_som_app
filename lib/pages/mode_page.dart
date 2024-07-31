import 'package:flutter/material.dart';

class ModePage extends StatefulWidget {
  const ModePage({super.key});

  @override
  State<ModePage> createState() => _ModePageState();
}

class _ModePageState extends State<ModePage> {
  var mainColor = const Color.fromARGB(255, 11, 54, 78);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: mainColor,
      child: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
