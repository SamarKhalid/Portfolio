import 'package:flutter/material.dart';

class CompactProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;

  const CompactProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  State<CompactProjectCard> createState() => _CompactProjectCardState();
}

class _CompactProjectCardState extends State<CompactProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _hovered ? -8.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.15),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(_hovered ? 0.2 : 0.1),
                blurRadius: _hovered ? 30 : 20,
                offset: Offset(0, _hovered ? 15 : 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.description.trim(),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
