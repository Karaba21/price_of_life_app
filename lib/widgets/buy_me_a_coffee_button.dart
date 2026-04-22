import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyMeACoffeeButton extends StatelessWidget {
  const BuyMeACoffeeButton({super.key});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://www.buymeacoffee.com/agustink');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _launchUrl,
      child: Image.network(
        'https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png',
        height: 60,
      ),
    );
  }
}
