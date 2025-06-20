import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_protfolio/conts/data.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  int? _expandedIndex;

  // Function to launch certificate link
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not launch URL')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.card_membership, size: 28),
            const SizedBox(width: 8),
            Text(
              "Certificates",
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: certificates.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final cert = certificates[index];
          final isExpanded = _expandedIndex == index;

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ExpansionTile(
              key: Key("cert_$index-${isExpanded}"), // Force rebuild
              initiallyExpanded: isExpanded,
              onExpansionChanged: (bool expanded) {
                setState(() {
                  _expandedIndex = expanded ? index : null;
                });
              },
              title: Text(
                cert.title,
                style: GoogleFonts.openSans(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${cert.issuer} • ${cert.date}"),
              children: [
                if (cert.description != null)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      cert.description!,
                      style: GoogleFonts.openSans(fontSize: 14),
                    ),
                  ),
                if (cert.link != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextButton.icon(
                      onPressed: () => _launchURL(cert.link!),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text("View Certificate"),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
