import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:perfection_som/widgets/device_item.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage>
    with TickerProviderStateMixin {
  BluetoothDevice? connectedDevice;
  List<BluetoothDevice> devices = [];
  bool isBluetoothEnable = false;
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);

    super.initState();
    checkBluetoothStatus();
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: isBluetoothEnable ? Colors.green : Colors.red,
              ),
              child: Center(
                child: isBluetoothEnable
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bluetooth Ativo ",
                            style: TextStyle(
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: mainColor,
                              value: controller.value,
                              strokeWidth: 2,
                              semanticsLabel: 'Circular progress indicator',
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "Bluetooth Desativado",
                        style: TextStyle(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              devices.isNotEmpty
                  ? devices.length.toString() + " Dispositivos encontrados."
                  : "",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return DeviceItem(
                  device: devices[index],
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void checkBluetoothStatus() async {
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      var status = await FlutterBluePlus.adapterState.first;
      setState(() {
        isBluetoothEnable = status == BluetoothAdapterState.on;
      });

      if (isBluetoothEnable) {
        print('entrou');
        await scanForDevices();
        print(devices.length.toString());
      } else {
        setState(() {
          devices.clear();
        });
      }
    });
  }

  Future<void> scanForDevices() async {
    FlutterBluePlus.startScan();
    List<BluetoothDevice> tempList = List.empty(growable: true);
    var subscription = FlutterBluePlus.scanResults.listen(
      (results) {
        for (ScanResult r in results) {
          for (ScanResult r in results) {
            if (!tempList.contains(r.device)) tempList.add(r.device);
          }
        }
      },
      onError: (e) => print("Error: " + e.toString()),
    );
    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      devices = tempList;
    });
    FlutterBluePlus.stopScan();
    subscription.cancel();
  }

  Future<void> connectToDevice() async {}
}
