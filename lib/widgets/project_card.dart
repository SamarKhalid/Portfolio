import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;
  final String videoPath;
  final String? appStoreLink;
  final String? playStoreLink;

  const ProjectCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.videoPath,
    this.appStoreLink,
    this.playStoreLink,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  late VideoPlayerController _controller;
  bool _hovered = false;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    if (widget.videoPath.isNotEmpty) {
      _controller = VideoPlayerController.asset(widget.videoPath)
        ..initialize()
            .then((_) {
              if (mounted) {
                setState(() {
                  _initialized = true;
                });
                _controller.setLooping(true);
              }
            })
            .catchError((error) {
              debugPrint(
                "Video initialization error for ${widget.videoPath}: $error",
              );
            });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _hovered ? -8.0 : 0.0),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 16),
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
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: _buildTextContent()),
                          const SizedBox(width: 40),
                          Expanded(flex: 2, child: _buildDeviceFrame()),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextContent(),
                          const SizedBox(height: 32),
                          Center(child: _buildDeviceFrame()),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.play_circle_outline, color: Colors.white70, size: 20),
            SizedBox(width: 8),
            Text(
              "Watch demo below",
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

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
        if (widget.appStoreLink != null || widget.playStoreLink != null) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (widget.appStoreLink != null &&
                  widget.appStoreLink!.isNotEmpty)
                _buildStoreButton(
                  icon: Icons.phone_iphone,
                  label: "App Store",
                  url: widget.appStoreLink!,
                ),
              if (widget.playStoreLink != null &&
                  widget.playStoreLink!.isNotEmpty)
                _buildStoreButton(
                  icon: Icons.android,
                  label: "Play Store",
                  url: widget.playStoreLink!,
                ),
            ],
          ),
        ],
        const SizedBox(height: 20),
        Text(
          widget.description.trim(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildStoreButton({
    required IconData icon,
    required String label,
    required String url,
  }) {
    return InkWell(
      onTap: () {
        FirebaseAnalytics.instance.logEvent(
          name: 'store_button_click',
          parameters: {
            'store_type': label,
            'project_name': widget.title,
            'url': url,
          },
        );
        launchUrl(Uri.parse(url));
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceFrame() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio > 0
            ? _controller.value.aspectRatio
            : 9 / 16, // Fallback to portrait
        child: _buildVideoContent(),
      ),
    );
  }

  Widget _buildVideoContent() {
    return _initialized
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand,
              children: [
                FittedBox(
                  fit: BoxFit.cover,
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
                Container(color: Colors.transparent),
                if (!_controller.value.isPlaying)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 48,
                      ),
                    ),
                  ),
              ],
            ),
          )
        : Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: Colors.white54,
                      strokeWidth: 2.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Loading Demo...",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
