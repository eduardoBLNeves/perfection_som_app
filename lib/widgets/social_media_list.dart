import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perfection_som/widgets/social_media_icon.dart';

class SocialMediaList extends StatelessWidget {
  const SocialMediaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
          buttonText: "WhatsApp",
          buttonColor1: const Color.fromARGB(255, 7, 94, 84),
          buttonColor2: const Color.fromARGB(255, 18, 140, 126),
          iconsColor: Colors.white,
          url:
              "https://wa.me/5511947759764?text=Olá, gostaria de um orçamento!",
          buttonIcon: FontAwesomeIcons.whatsapp,
        ),
        SocialMediaIcon(
          buttonText: "Instagram",
          buttonColor1: const Color.fromARGB(255, 129, 52, 175),
          buttonColor2: const Color.fromARGB(255, 245, 133, 41),
          iconsColor: Colors.white,
          url: "https://instagram.com/perfection_som",
          buttonIcon: FontAwesomeIcons.instagram,
        ),
        SocialMediaIcon(
          buttonText: "Nossa Loja",
          buttonColor1: const Color.fromARGB(255, 9, 89, 194),
          buttonColor2: const Color.fromARGB(255, 82, 145, 247),
          iconsColor: Colors.white,
          buttonIcon: FontAwesomeIcons.locationDot,
          url:
              "https://www.google.com/maps/search/?api=1&query=perfection+som+e+acessorios",
        ),
      ],
    );
  }
}
