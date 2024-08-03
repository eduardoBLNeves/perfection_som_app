import 'package:flutter/material.dart';
import 'package:perfection_som/widgets/social_media/social_media_list.dart';

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 40, bottom: 40),
      child: Container(
        padding:
            const EdgeInsets.only(left: 40, right: 40, bottom: 40, top: 30),
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
            Center(
              child: Text(
                "Entre em contato!",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            SocialMediaList(),
          ],
        ),
      ),
    );
  }
}
