import 'package:flutter/material.dart';

class ColorPaletteWidget extends StatelessWidget {
  const ColorPaletteWidget({
    super.key,
    required this.onUpdateColor,
    required this.borderAndIconColor,
  });

  final Function(Color) onUpdateColor;
  final Color borderAndIconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(
          width: 20,
        ),
        //FIRST-----
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.purple),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
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
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(Colors.yellow),
              shadowColor: WidgetStateProperty.all<Color>(Colors.black),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            onPressed: () {
              onUpdateColor(Colors.yellow);
            },
            child: null,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
