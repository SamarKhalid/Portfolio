import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:samar_portfolio/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_text_styles.dart';
import '../constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjects;
  const HeroSection({super.key, required this.onViewProjects});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1200;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 24, vertical: 80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: isWide
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Text(
                  "Samar Khaled Mohamed",
                  style: AppTextStyles.h1(
                    context,
                  ).copyWith(color: AppColors.whiteText),
                ),
                const SizedBox(height: 12),
                Text(
                  "Flutter Developer || Masters Student",
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  alignment: isWide
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        FirebaseAnalytics.instance.logEvent(
                          name: 'view_projects_click',
                        );
                        onViewProjects();
                      },
                      icon: const Icon(Icons.work_outline),
                      label: const Text("View Projects"),
                    ),
                    OutlinedButton.icon(
                      onPressed: () =>
                          launchUrl(Uri.parse("mailto:${AppConstants.email}")),
                      icon: const Icon(
                        Icons.email_outlined,
                        color: AppColors.whiteText,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.whiteText,
                        side: const BorderSide(color: AppColors.whiteText),
                      ),

                      label: const Text("Contact Me"),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                isWide
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _socialIcon(Icons.phone, AppConstants.phone),
                          const SizedBox(width: 16),
                          _socialIcon(
                            Icons.link,
                            AppConstants.linkedIn,
                            url: AppConstants.linkedInLink,
                          ),
                          const SizedBox(width: 16),
                          _socialIcon(
                            Icons.code,
                            AppConstants.gitHub,
                            url: AppConstants.gitHubLink,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _socialIcon(Icons.phone, AppConstants.phone),
                            ],
                          ),

                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _socialIcon(
                                Icons.link,
                                AppConstants.linkedIn,
                                url: AppConstants.linkedInLink,
                              ),
                              const SizedBox(height: 12),
                              _socialIcon(
                                Icons.code,
                                AppConstants.gitHub,
                                url: AppConstants.gitHubLink,
                              ),
                            ],
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(IconData icon, String text, {String? url}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: url != null ? () => launchUrl(Uri.parse(url)) : null,
        child: Row(
          children: [
            Icon(icon, color: AppColors.whiteText, size: 20),
            const SizedBox(width: 6),
            Text(text, style: const TextStyle(color: AppColors.whiteText)),
          ],
        ),
      ),
    );
  }
}
