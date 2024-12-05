import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                await launchUrl(Uri(scheme: 'https', path: 't.me/xumoyunf'));
              },
              tooltip: "t.me/xumoyunf",
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedTelegram,
                size: 40.0,
                color: light,
              )),
          IconButton(
              onPressed: () async {
                await launchUrl(Uri(scheme: 'https', path: 'xakimjonov.aqulas.me'));
              },
              tooltip: "https://xakimjonov.aqulas.me",
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedGlobe02,
                size: 40.0,
                color: light,
              )),
          IconButton(
              onPressed: () async {
                await launchUrl(Uri(scheme: 'tel', path: '+998958585424'));
              },
              tooltip: "+998958585424",
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedCall,
                size: 40,
                color: light,
              )),
        ],
      ),
    );
  }
}
