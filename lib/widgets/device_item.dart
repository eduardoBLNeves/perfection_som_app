import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceItem extends StatefulWidget {
  final BluetoothDevice device;

  const DeviceItem({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  State<DeviceItem> createState() => _DeviceItemState();
}

class _DeviceItemState extends State<DeviceItem> {
  String deviceName = "";

  @override
  void initState() {
    deviceName = widget.device.name == ""
        ? (widget.device.advName == "" ? '' : widget.device.advName)
        : widget.device.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: Icon(Icons.bluetooth),
        title: Text(deviceName),
        subtitle: Text(widget.device.id.toString()),
        trailing: Container(
          height: 40,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: const Color.fromARGB(255, 11, 54, 78),
          ),
          child: TextButton(
            onPressed: () {
              // Ação personalizada, como conectar ao dispositivo
            },
            child: Text(
              widget.device.isConnected ? 'Conectado' : 'Conectar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
