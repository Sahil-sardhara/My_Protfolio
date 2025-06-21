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
    final width = MediaQuery.of(context).size.width;

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 700;

          return ListView.builder(
            itemCount: certificates.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final cert = certificates[index];
              final isExpanded = _expandedIndex == index;

              return Align(
                alignment: Alignment.center,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isWide ? 700 : double.infinity,
                  ),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ExpansionTile(
                      key: Key("cert_$index-${isExpanded}"),
                      initiallyExpanded: isExpanded,
                      onExpansionChanged: (bool expanded) {
                        setState(() {
                          _expandedIndex = expanded ? index : null;
                        });
                      },
                      title: Text(
                        cert.title,
                        style: GoogleFonts.openSans(
                          fontWeight: FontWeight.bold,
                          fontSize: isWide ? 18 : 16,
                        ),
                      ),
                      subtitle: Text(
                        "${cert.issuer} • ${cert.date}",
                        style: TextStyle(fontSize: isWide ? 14 : 13),
                      ),
                      children: [
                        if (cert.description != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              cert.description!,
                              style: GoogleFonts.openSans(
                                fontSize: isWide ? 15 : 14,
                              ),
                            ),
                          ),
                        if (cert.link != null)
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 12,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton.icon(
                                onPressed: () => _launchURL(cert.link!),
                                icon: const Icon(Icons.open_in_new),
                                label: const Text("View Certificate"),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
