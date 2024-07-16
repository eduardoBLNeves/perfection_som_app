import 'package:flutter/material.dart';

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({super.key, required this.onUpdateColor});

  final Function(Color) onUpdateColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //FIRST-----
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.red);
            },
            child: null,
          ),
        ),

        //SECOND-----
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.blue);
            },
            child: null,
          ),
        ),

        //THIRD-----
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.purple);
            },
            child: null,
          ),
        ),

        //FOURTH-----
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.green);
            },
            child: null,
          ),
        ),

        //FIFTH-----
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.yellow);
            },
            child: null,
          ),
        ),
      ],
    );
  }
}
