import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_constants.dart';
import '../widgets/section_title.dart';

class PublicationsSection extends StatelessWidget {
  const PublicationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 1000;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: "Publications",
            subtitle: "Academic contributions and research papers.",
          ),
          const SizedBox(height: 32),
          ...AppConstants.publications.map((pub) {
            return _buildPublicationCard(context, pub);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildPublicationCard(BuildContext context, Map<String, String> pub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pub["title"]!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          if (pub.containsKey("authors")) ...[
            Text(
              "Authors: ${pub["authors"]}",
              style: const TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 8),
          ],
          Text(
            pub["conference"]!,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
          if (pub.containsKey("citation")) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white12),
              ),
              child: SelectableText(
                "Citation: ${pub["citation"]}",
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 13,
                  fontFamily: 'RobotoMono',
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _launchUrl(pub["link"]!),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "View Publication",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_outward, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }
}
