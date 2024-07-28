import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteColorsWidget extends StatefulWidget {
  FavoriteColorsWidget({
    super.key,
    required this.onSaveFavorite,
    required this.onClickUpdateColor,
    required this.borderAndIconColor,
  });

  final Function(String) onSaveFavorite;
  final Function(Color) onClickUpdateColor;
  final Color borderAndIconColor;

  @override
  State<FavoriteColorsWidget> createState() => _FavoriteColorsWidgetState();
}

class _FavoriteColorsWidgetState extends State<FavoriteColorsWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async => await getItems());
  }

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
              border: Border.all(color: widget.borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(_first),
                shadowColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (_first == Colors.transparent) {
                  await widget.onSaveFavorite("first");
                  await getItems();
                } else {
                  widget.onClickUpdateColor(_first);
                }
              },
              icon: _first == Colors.transparent
                  ? Icon(
                      Icons.add,
                      color: widget.borderAndIconColor,
                      size: 18,
                    )
                  : const Icon(null),
            ),
            onLongPress: () async {
              await deleteItem("first");
            },
          ),
        ),

        //SECOND-----
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: widget.borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(_second),
                shadowColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (_second == Colors.transparent) {
                  await widget.onSaveFavorite("second");
                  await getItems();
                } else {
                  widget.onClickUpdateColor(_second);
                }
              },
              icon: _second == Colors.transparent
                  ? Icon(
                      Icons.add,
                      color: widget.borderAndIconColor,
                      size: 18,
                    )
                  : const Icon(null),
            ),
            onLongPress: () async {
              await deleteItem("second");
            },
          ),
        ),

        //THIRD-----
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: widget.borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(_third),
                shadowColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (_third == Colors.transparent) {
                  await widget.onSaveFavorite("third");
                  await getItems();
                } else {
                  widget.onClickUpdateColor(_third);
                }
              },
              icon: _third == Colors.transparent
                  ? Icon(
                      Icons.add,
                      color: widget.borderAndIconColor,
                      size: 18,
                    )
                  : const Icon(null),
            ),
            onLongPress: () async {
              await deleteItem("third");
            },
          ),
        ),

        //FOURTH-----
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: widget.borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(_fourth),
                shadowColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (_fourth == Colors.transparent) {
                  await widget.onSaveFavorite("fourth");
                  await getItems();
                } else {
                  widget.onClickUpdateColor(_fourth);
                }
              },
              icon: _fourth == Colors.transparent
                  ? Icon(
                      Icons.add,
                      color: widget.borderAndIconColor,
                      size: 18,
                    )
                  : const Icon(null),
            ),
            onLongPress: () async {
              await deleteItem("fourth");
            },
          ),
        ),

        //FIFTH-----
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(color: widget.borderAndIconColor),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: GestureDetector(
            child: IconButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(_fifth),
                shadowColor: WidgetStateProperty.all<Color>(Colors.black),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (_fifth == Colors.transparent) {
                  await widget.onSaveFavorite("fifth");
                  await getItems();
                } else {
                  widget.onClickUpdateColor(_fifth);
                }
              },
              icon: _fifth == Colors.transparent
                  ? Icon(
                      Icons.add,
                      color: widget.borderAndIconColor,
                      size: 18,
                    )
                  : const Icon(null),
            ),
            onLongPress: () async {
              await deleteItem("fifth");
            },
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  Color _first = Colors.transparent;
  Color _second = Colors.transparent;
  Color _third = Colors.transparent;
  Color _fourth = Colors.transparent;
  Color _fifth = Colors.transparent;

  getItems() async {
    final prefs = await SharedPreferences.getInstance();

    String? firstColor = prefs.getString('first');
    String? secondColor = prefs.getString('second');
    String? thirdColor = prefs.getString('third');
    String? fourthColor = prefs.getString('fourth');
    String? fifthColor = prefs.getString('fifth');
    setState(() {
      if (firstColor != null) {
        _first = Color(int.parse(firstColor, radix: 16));
      } else {
        _first = Colors.transparent;
      }

      if (secondColor != null) {
        _second = Color(int.parse(secondColor, radix: 16));
      } else {
        _second = Colors.transparent;
      }

      if (thirdColor != null) {
        _third = Color(int.parse(thirdColor, radix: 16));
      } else {
        _third = Colors.transparent;
      }

      if (fourthColor != null) {
        _fourth = Color(int.parse(fourthColor, radix: 16));
      } else {
        _fourth = Colors.transparent;
      }

      if (fifthColor != null) {
        _fifth = Color(int.parse(fifthColor, radix: 16));
      } else {
        _fifth = Colors.transparent;
      }
    });
  }

  deleteItem(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
    await prefs.remove(key + "_pos");
    await getItems();
  }
}
