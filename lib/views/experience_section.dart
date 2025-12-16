import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
            title: "Experience",
            subtitle: "My professional journey so far.",
          ),
          const SizedBox(height: 32),
          ...AppConstants.experience.map((exp) {
            return _buildExperienceCard(context, exp);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Map<String, dynamic> exp) {
    final String company = exp["company"] ?? "";
    final List<dynamic> roles = exp["roles"] ?? [];

    final String mainTitle = roles.isNotEmpty ? roles.first["title"] : "";

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
            mainTitle,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          if (company.isNotEmpty)
            Text(
              company,
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
          const SizedBox(height: 16),

          ...roles.map((role) {
            final isLast = role == roles.last;
            return Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    role["period"]!,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (role["type"]!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        role["type"]!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
