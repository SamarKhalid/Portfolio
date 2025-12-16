import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.sectionTitle(
            context,
          ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        if (subtitle != null) const SizedBox(height: 6),
        if (subtitle != null)
          Text(
            subtitle!,
            style: AppTextStyles.body.copyWith(
              color: Colors.white.withOpacity(0.85),
            ),
          ),
      ],
    );
  }
}
