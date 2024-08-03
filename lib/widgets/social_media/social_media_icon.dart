import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIcon extends StatelessWidget {
  SocialMediaIcon({
    super.key,
    required this.iconsColor,
    required this.buttonColor1,
    required this.buttonColor2,
    required this.buttonIcon,
    required this.buttonText,
    required this.url,
  });
  final Color iconsColor;
  final Color buttonColor1;
  final Color buttonColor2;
  final IconData buttonIcon;
  final String buttonText;
  final String url;
  final double marginSize = 10;
  final BorderRadiusGeometry borderRadius = const BorderRadius.all(
    Radius.circular(10),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: marginSize,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  buttonColor2,
                  buttonColor1,
                ],
              )),
          child: ElevatedButton(
            onPressed: () async {
              await launchUrl(Uri.parse(url),
                  mode: LaunchMode.inAppBrowserView);
            },
            style: ElevatedButton.styleFrom(
              side: const BorderSide(
                color: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  buttonIcon,
                  color: iconsColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: iconsColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
