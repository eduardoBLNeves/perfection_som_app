import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothPage extends StatefulWidget {
  const BluetoothPage({super.key});

  @override
  State<BluetoothPage> createState() => _BluetoothPageState();
}

class _BluetoothPageState extends State<BluetoothPage> {
  BluetoothDevice? _connectedDevice;
  List<BluetoothService> _services = [];

  @override
  void initState() {
    super.initState();
    startScan();
  }

  void startScan() {
    FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        if (r.device.name == "NomeDoSeuDispositivo") {
          FlutterBluePlus.stopScan();
          connectToDevice(r.device);
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    setState(() {
      _connectedDevice = device;
    });
    discoverServices();
  }

  void discoverServices() async {
    if (_connectedDevice == null) return;
    List<BluetoothService> services =
        await _connectedDevice!.discoverServices();
    setState(() {
      _services = services;
    });
  }

  void sendColor(BluetoothCharacteristic characteristic, Color color) async {
    List<int> value = [color.red, color.green, color.blue];
    await characteristic.write(value);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _services.length,
      itemBuilder: (context, index) {
        var service = _services[index];
        return ListTile(
          title: Text('Service: ${service.uuid.toString()}'),
          subtitle: Column(
            children: service.characteristics.map((characteristic) {
              return ListTile(
                title:
                    Text('Characteristic: ${characteristic.uuid.toString()}'),
                trailing: ElevatedButton(
                  child: Text('Send Color'),
                  onPressed: () {
                    sendColor(characteristic, Colors.red);
                  },
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
