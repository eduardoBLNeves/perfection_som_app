import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:perfection_som/widgets/color_palette.dart';
import 'package:perfection_som/widgets/favorite_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfection Som',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color selectedColor = Colors.red;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Color.fromARGB(255, 244, 137, 14),
        title: const Text(
          'Perfection Som',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
      ),
      body: Container(
        height: double.infinity,
        color: Color.fromARGB(255, 228, 238, 255),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  addItemsToLocalStorage(String key) async {
    print(key);
    final prefs = await SharedPreferences.getInstance();
    String colorString = selectedColor.value.toRadixString(16);
    await prefs.setString(key, colorString);
  }
}