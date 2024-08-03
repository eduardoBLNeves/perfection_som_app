import 'package:flutter/material.dart';
import 'package:perfection_som/widgets/bluetooth_status.dart';
import 'package:perfection_som/widgets/social_media/social_media_container.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> with TickerProviderStateMixin {
  var mainColor = const Color.fromARGB(255, 11, 54, 78);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: mainColor,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SocialMediaContainer(),
            BluetoothStatus(),
          ],
        ),
      ),
    );
  }
}
