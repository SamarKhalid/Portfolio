import 'package:flutter/material.dart';
import '../widgets/section_title.dart';
import '../widgets/project_card.dart';
import '../widgets/compact_project_card.dart';
import '../constants/app_constants.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  final ScrollController? controller;
  const ProjectsSection({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isWide = mq.size.width > 1000;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: "Projects"),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.whiteText.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.whiteText.withOpacity(0.2)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.whiteText),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Some of the projects featured here are commercial client work. While I can't share the source code for these, I've created video walkthroughs to demonstrate their features and my contributions.",
                    style: AppTextStyles.body.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ...AppConstants.projects.map((p) {
            return ProjectCard(
              title: p["title"],
              subtitle: p["subtitle"],
              videoPath: p["videoPath"],
              description: p["description"],
            );
          }).toList(),
          if (AppConstants.moreProjects.isNotEmpty) ...[
            const SizedBox(height: 32),
            if (isWide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CompactProjectCard(
                      title: AppConstants.moreProjects[0]["title"],
                      subtitle: AppConstants.moreProjects[0]["subtitle"],
                      description: AppConstants.moreProjects[0]["description"],
                    ),
                  ),
                  const SizedBox(width: 32),
                  Expanded(
                    child: CompactProjectCard(
                      title: AppConstants.moreProjects[1]["title"],
                      subtitle: AppConstants.moreProjects[1]["subtitle"],
                      description: AppConstants.moreProjects[1]["description"],
                    ),
                  ),
                ],
              )
            else
              Column(
                children: AppConstants.moreProjects.map((p) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: CompactProjectCard(
                      title: p["title"],
                      subtitle: p["subtitle"],
                      description: p["description"],
                    ),
                  );
                }).toList(),
              ),
          ],
          const SizedBox(height: 48),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.whiteText.withOpacity(0.05),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.whiteText.withOpacity(0.1)),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "This portfolio is built with Flutter 💙",
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => launchUrl(
                      Uri.parse("https://github.com/SamarKhalid/Portfolio"),
                    ),
                    child: Text(
                      "Check out the source code",
                      style: AppTextStyles.body.copyWith(
                        decoration: TextDecoration.underline,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
