import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:perfection_som/widgets/color_palette.dart';
import 'package:perfection_som/widgets/favorite_colors.dart';
import 'package:perfection_som/widgets/slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedColor = Colors.red;
  Color colorToSend = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.grey.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 20,
                          color: colorToSend,
                        ),
                        shape: BoxShape.circle),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.62,
                        child: ColorPicker(
                          pickerColor: selectedColor,
                          paletteType: PaletteType.hueWheel,
                          colorPickerWidth: 280,
                          onColorChanged: (Color value) {
                            updateColor(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SliderPicker(
              width: 280,
              currentColor: selectedColor,
              onClickUpdateColor: setColorToSend,
            ),
            const SizedBox(
              height: 20,
            ),
            ColorPaletteWidget(
              onUpdateColor: updateColor,
            ),
            const SizedBox(
              height: 10,
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
    });
  }

  void setColorToSend(Color color) {
    colorToSend = color;
  }

  addItemsToLocalStorage(String key) async {
    print(key);
    final prefs = await SharedPreferences.getInstance();
    String colorString = selectedColor.value.toRadixString(16);
    await prefs.setString(key, colorString);
  }
}
