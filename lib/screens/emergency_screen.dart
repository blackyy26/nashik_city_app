import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({super.key});

  Future<void> _call(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _tile('Police', '100'),
          _tile('Ambulance', '108'),
          _tile('Fire Brigade', '101'),
          _tile('Women Helpline', '181'),
        ],
      ),
    );
  }

  Widget _tile(String title, String number) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.call, color: Colors.red),
        title: Text(title),
        subtitle: Text('Call $number'),
        onTap: () => _call(number),
      ),
    );
  }
}
