import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:perfection_som/widgets/color_palette.dart';
import 'package:perfection_som/widgets/favorite_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      // color: Color.fromARGB(255, 228, 238, 255),
      color: Color.fromARGB(255, 185, 185, 185),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.85,
                      child: ColorPicker(
                        pickerColor: selectedColor,
                        paletteType: PaletteType.hueWheel,
                        colorPickerWidth: 380,
                        onColorChanged: (Color value) {
                          updateColor(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ColorPaletteWidget(
              onUpdateColor: updateColor,
            ),
            const SizedBox(
              height: 20,
            ),
            FavoriteColorsWidget(
              onSaveFavorite: addItemsToLocalStorage,
              onClickUpdateColor: updateColor,
            ),
          ],
        ),
      ),
    );
  }

  void updateColor(Color color) {
    setState(() {
      selectedColor = color;
      //send bluetooth
    });
  }

  addItemsToLocalStorage(String key) async {
    print(key);
    final prefs = await SharedPreferences.getInstance();
    String colorString = selectedColor.value.toRadixString(16);
    await prefs.setString(key, colorString);
  }
}