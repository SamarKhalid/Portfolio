import 'package:flutter/material.dart';
import 'package:samar_portfolio/constants/app_colors.dart';
import 'package:samar_portfolio/views/experience_section.dart';
import 'package:samar_portfolio/views/hero_section.dart';
import 'package:samar_portfolio/views/project_section.dart';
import 'package:samar_portfolio/views/publications_section.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  final _scrollController = ScrollController();
  MyPortfolioApp({super.key});

  final _projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samar Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: AppColors.mainGradient),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                HeroSection(
                  onViewProjects: () {
                    Scrollable.ensureVisible(
                      _projectsKey.currentContext!,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                ExperienceSection(),
                ProjectsSection(key: _projectsKey),
                PublicationsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
