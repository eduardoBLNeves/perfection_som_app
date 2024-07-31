import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:perfection_som/widgets/social_media_list.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> with TickerProviderStateMixin {
  bool isBluetoothEnable = false;

  @override
  void initState() {
    super.initState();
    checkBluetoothStatus();
    Timer.periodic(const Duration(seconds: 8), (timer) async {
      checkBluetoothStatus();
    });
  }

  var mainColor = const Color.fromARGB(255, 11, 54, 78);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: mainColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 40, bottom: 40),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, bottom: 40, top: 30),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 207, 207, 207),
                      offset: Offset(0, 0),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color.fromARGB(255, 240, 240, 240),
                ),
                child: const Column(
                  children: [
                    const Center(
                      child: Text(
                        "Entre em contato!",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SocialMediaList(),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: isBluetoothEnable ? Colors.green : Colors.red,
              ),
              child: Center(
                child: isBluetoothEnable
                    ? Text(
                        "Bluetooth: Ativado",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : Text(
                        "Bluetooth: Desativado",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkBluetoothStatus() async {
    var status = await FlutterBluePlus.adapterState.first;
    setState(() {
      isBluetoothEnable = status == BluetoothAdapterState.on;
    });
  }
}
