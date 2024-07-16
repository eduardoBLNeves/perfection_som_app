import 'package:flutter/material.dart';
import 'package:perfection_som/pages/bluetooth_page.dart';
import 'package:perfection_som/pages/home_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Color.fromARGB(255, 244, 137, 14),
        title: const Text(
          'Perfection Som',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 119, 40),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 39, 39, 39),
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomePage(),
          BluetoothPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Color.fromARGB(255, 255, 126, 52),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bluetooth),
            label: 'Bluetooth',
          ),
        ],
      ),
    );
  }
}
