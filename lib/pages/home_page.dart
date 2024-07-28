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
  Color selectedColorPicker = Colors.red;
  Color colorToSend = Colors.red;
  Color colorForSlideBar = Colors.red;
  double sliderPosition = 0;
  double sliderWidth = 225; //280;
  bool isCustomColor = false;
  Color borderAndIconColor = const Color.fromARGB(255, 216, 216, 216);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Color.fromARGB(255, 11, 54, 78),
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
                          color: isCustomColor ? colorToSend : colorForSlideBar,
                        ),
                        shape: BoxShape.circle),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.62,
                        child: ColorPicker(
                          pickerColor: selectedColorPicker,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.light_mode,
                  size: 24,
                  color: borderAndIconColor,
                ),
                SliderPicker(
                  width: sliderWidth,
                  currentColor: colorForSlideBar,
                  sliderPosition: sliderPosition,
                  onClickUpdateColor: setColorToSend,
                  onUpdateSlider: setSlider,
                ),
                Icon(
                  Icons.light_mode_outlined,
                  size: 24,
                  color: borderAndIconColor,
                ),
                const SizedBox(
                  width: 25,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ColorPaletteWidget(
              onUpdateColor: updateBySettedColor,
              borderAndIconColor: borderAndIconColor,
            ),
            const SizedBox(
              height: 10,
            ),
            FavoriteColorsWidget(
              onSaveFavorite: addItemsToLocalStorage,
              onClickUpdateColor: updateBySettedColor,
              borderAndIconColor: borderAndIconColor,
            ),
          ],
        ),
      ),
    );
  }

  void updateColor(Color color) {
    setState(() {
      isCustomColor = true;
      selectedColorPicker = color;
      colorForSlideBar = color;
      sliderPosition = double.minPositive;
    });
  }

  Future<void> updateBySettedColor(Color color) async {
    setState(() {
      isCustomColor = false;
      selectedColorPicker = setColorBright(color);
      colorForSlideBar = color;
      sliderPosition = _calculatePositionFromColor(color);
      setColorToSend(color);
    });
  }

  double _calculatePositionFromColor(Color color) {
    var pos = sliderWidth * color.computeLuminance();
    return pos;
  }

  void setColorToSend(Color color) {
    if (color == colorToSend) return;
    setState(() {
      colorToSend = color;
    });
    sendToBluethoot();
  }

  void sendToBluethoot() {
    print("------- Enviando Bluetooth ------");
  }

  Color setColorBright(Color color) {
    if (color.red > color.blue && color.red > color.green)
      color = color.withRed(255);
    else if (color.blue > color.red && color.blue > color.green)
      color = color.withBlue(255);
    else if (color.green > color.blue && color.green > color.red)
      color = color.withGreen(255);
    return color;
  }

  void setSlider(double position) {
    isCustomColor = true;
    sliderPosition = position;
  }

  addItemsToLocalStorage(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String colorString = colorForSlideBar.value.toRadixString(16);
    await prefs.setString(key, colorString);
  }
}
