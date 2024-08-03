import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfection_som/pages/info_page.dart';
import 'package:perfection_som/pages/home_page.dart';
import 'package:perfection_som/pages/styles_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  int currentPageIndex = 0;
  Color backgroundColor = const Color.fromARGB(255, 11, 54, 78);
  Color primaryColor = const Color.fromARGB(255, 255, 126, 52);
  Color appBarBackgroundColor = const Color.fromARGB(255, 5, 23, 32);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: const Color.fromARGB(255, 9, 40, 55),
        title: const Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
            width: 180,
          ),
        ),
        backgroundColor: appBarBackgroundColor,
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomePage(),
          StylePage(),
          InfoPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 52,
        backgroundColor: backgroundColor,
        buttonBackgroundColor: const Color.fromARGB(255, 5, 23, 32),
        color: const Color.fromARGB(255, 5, 23, 32),
        animationDuration: const Duration(milliseconds: 100),
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Color.fromARGB(255, 212, 212, 212)),
          Icon(FontAwesomeIcons.sliders,
              color: Color.fromARGB(255, 212, 212, 212)),
          Icon(Icons.info, color: Color.fromARGB(255, 212, 212, 212)),
        ],
      ),
    );
  }
}
