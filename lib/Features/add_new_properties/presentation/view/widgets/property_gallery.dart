import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';

class PropertyGallery extends StatefulWidget {
  final bool isDark;
  final String? mainImage;
  final List<String> images;

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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoControllers();
  }

  void _initializeVideoControllers() {
    final videoUrls = <String>[];
    if (widget.mainImage != null && _isVideo(widget.mainImage!)) {
      videoUrls.add(widget.mainImage!);
    }
    for (var image in widget.images) {
      if (_isVideo(image)) {
        videoUrls.add(image);
      }
    }
    _videoControllers =
        videoUrls
            .map(
              (url) => VideoPlayerController.network(url)
                ..initialize()
                    .then((_) {
                      if (mounted) {
                        setState(() {});
                      }
                    })
                    .catchError((error) {
                      print( S.of(context).videoError);
                    }),
            )
            .toList();
    setState(() {
      _isLoading = false;
    });
  }

  bool _isVideo(String url) {
    return url.contains('.mp4') || url.contains('.mov');
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _showMediaDialog(String url) {
    VideoPlayerController? controller;
    if (_isVideo(url)) {
      controller = _videoControllers.firstWhere(
        (c) => c.dataSource == url,
        orElse: () => VideoPlayerController.network(url),
      );
      controller.initialize().then((_) {
        controller!.play();
        setState(() {});
      });
    }

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content:
                _isVideo(url)
                    ? SizedBox(
                      width: double.maxFinite,
                      child: AspectRatio(
                        aspectRatio: controller!.value.aspectRatio,
                        child: VideoPlayer(controller),
                      ),
                    )
                    : Image.network(url),
            actions: [
              TextButton(
                onPressed: () {
                  if (_isVideo(url)) {
                    controller!.pause();
                  }
                  Navigator.pop(context);
                },
                child: Text(S.of(context).close),
              ),
            ],
          ),
    ).then((_) {
      if (_isVideo(url)) {
        controller!.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final allMedia = <String>[];
    if (widget.mainImage != null && widget.mainImage!.isNotEmpty) {
      allMedia.add(widget.mainImage!);
    }
    allMedia.addAll(widget.images.where((image) => image.isNotEmpty));

    bool allMediaUnavailable = allMedia.isEmpty;

    if (allMediaUnavailable) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              S.of(context).gallery,
              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                color:
                    widget.isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
              ),
            ),
          ),
          Center(
            child: Text(
              S.of(context).noMediaAvailable,
              style: TextStyle(
                color:
                    widget.isDark
                        ? AppColors.darkModeText
                        : AppColors.lightModeText,
              ),
            ),
          ),
        ],
      );
    }

    final displayItems = [
      allMedia[0],
      if (allMedia.length > 1) allMedia[1] else allMedia[0],
      if (allMedia.length > 2) allMedia[2] else allMedia[0],
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            S.of(context).gallery,
            style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
              color:
                  widget.isDark
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
                child: GestureDetector(
                  onTap: () => _showMediaDialog(displayItems[0]),
                  child: _buildMediaWidget(displayItems[0], 286),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () => _showMediaDialog(displayItems[1]),
                      child: _buildMediaWidget(displayItems[1], 140),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GestureDetector(
                      onTap: () => _showMediaDialog(displayItems[2]),
                      child: _buildMediaWidget(displayItems[2], 140),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GestureDetector(
            onTap: () => _showMediaDialog(displayItems[0]),
            child: _buildMediaWidget(
              displayItems[0],
              170,
              width: double.infinity,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMediaWidget(String? url, double height, {double? width}) {
    if (url == null || url.isEmpty) {
      return Container(
        height: height,
        width: width ?? double.infinity,
        color: AppColors.graysGray2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.of(context).gallery,
                style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                  color:
                      widget.isDark
                          ? AppColors.darkModeButtonsPrimary
                          : AppColors.lightModeButtonsPrimary,
                ),
              ),
            ),
            Center(
              child: Text(
                S.of(context).noMediaAvailable,
                style: TextStyle(
                  color:
                      widget.isDark
                          ? AppColors.darkModeText
                          : AppColors.lightModeText,
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_isVideo(url)) {
      final controller = _videoControllers.firstWhere(
        (c) => c.dataSource == url,
        orElse: () => VideoPlayerController.network(url),
      );
      return SizedBox(
        height: height,
        width: width ?? double.infinity,
        child:
            controller.value.isInitialized
                ? VideoPlayer(controller)
                : CustomLoading(),
      );
    } else {
      return Image.network(
        url,
        height: height,
        width: width ?? double.infinity,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
              color: AppColors.graysGray2,
              child: Center(child: Text(S.of(context).mediaLoadError)),
            ),
      );
    }
  }
}
