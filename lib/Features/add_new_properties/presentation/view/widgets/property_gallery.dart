import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';

class PropertyGallery extends StatefulWidget {
  final bool isDark;
  final String mainImage; // يمكن أن يكون URL لصورة أو فيديو
  final List<String> images; // يمكن أن تحتوي على صور أو فيديوهات

  const PropertyGallery({
    super.key,
    required this.isDark,
    required this.mainImage,
    required this.images,
  });

  @override
  State<PropertyGallery> createState() => _PropertyGalleryState();
}

class _PropertyGalleryState extends State<PropertyGallery> {
  late List<VideoPlayerController> _videoControllers;

  @override
  void initState() {
    super.initState();
    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    final urls = [widget.mainImage, ...widget.images];
    _videoControllers = urls.map((url) {
      if (url != null && (url.contains('.mp4') || url.contains('.mov'))) {
        try {
          return VideoPlayerController.network(url)
            ..initialize().then((_) {
              if (mounted) setState(() {});
            }).catchError((error) {
              print('Video initialization error: $error');
            });
        } catch (e) {
          print('Error creating VideoPlayerController: $e');
          return null;
        }
      }
      return null;
    }).whereType<VideoPlayerController>().toList();
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final displayItems = [
      widget.mainImage,
      if (widget.images.isNotEmpty) widget.images[0] else widget.mainImage,
      if (widget.images.length > 1) widget.images[1] else widget.mainImage,
    ];

    // التحقق إذا كانت كل العناصر null أو فارغة
    bool allMediaUnavailable = displayItems.every((item) => item == null || item.isEmpty);

    if (allMediaUnavailable) {
      return Center(
        child: Text(
          'No media available',
          style: TextStyle(
            color: widget.isDark ? AppColors.darkModeText : AppColors.lightModeText,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            S.of(context).gallery,
            style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
              color: widget.isDark
                  ? AppColors.darkModeButtonsPrimary
                  : AppColors.lightModeButtonsPrimary,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _buildMediaWidget(displayItems[0], 286),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildMediaWidget(displayItems[1], 140),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: _buildMediaWidget(displayItems[2], 140),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: _buildMediaWidget(displayItems[0], 170, width: double.infinity),
        ),
      ],
    );
  }

  Widget _buildMediaWidget(String? url, double height, {double? width}) {
    if (url == null || url.isEmpty) {
      return SizedBox(height: height, width: width); // يترك المساحة فارغة
    }

    if (url.contains('.mp4') || url.contains('.mov')) {
      final index = [widget.mainImage, ...widget.images].indexOf(url);
      if (index >= _videoControllers.length || !_videoControllers[index].value.isInitialized) {
        return CustomLoading();
      }
      return SizedBox(
        height: height,
        width: width,
        child: VideoPlayer(_videoControllers[index]),
      );
    } else {
      return Image.network(
        url,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(height: height, width: width); // يترك المساحة فارغة عند الخطأ
        },
      );
    }
  }
}