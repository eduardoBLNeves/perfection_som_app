import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothStatus extends StatefulWidget {
  const BluetoothStatus({super.key});

  @override
  State<BluetoothStatus> createState() => _BluetoothStatusState();
}

class _BluetoothStatusState extends State<BluetoothStatus> {
  bool isBluetoothEnable = false;

  @override
  void initState() {
    super.initState();
    checkBluetoothStatus();
    Timer.periodic(const Duration(seconds: 8), (timer) async {
      checkBluetoothStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          width: 1,
          color: isBluetoothEnable ? Colors.green : Colors.red,
        ),
      ),
      child: Center(
        child: isBluetoothEnable
            ? Text(
                "Bluetooth: Ativado",
                style: TextStyle(
                  color: isBluetoothEnable ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              )
            : Text(
                "Bluetooth: Desativado",
                style: TextStyle(
                  color: isBluetoothEnable ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w400,
                ),
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
