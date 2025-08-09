import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/unit_details_column.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_new_properties/data/models/property_details_model.dart';

class UnitDetailsCard extends StatelessWidget {
  const UnitDetailsCard({
    super.key,
    required this.context,
    required this.isDark,
    required this.details,
  });

  final BuildContext context;
  final bool isDark;
  final PropertyDetailsModel details;

  void _showMediaDialog(String url) {
    VideoPlayerController? controller;
    if (_isVideo(url)) {
      controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          showDialog(
            context: context,
            builder:
                (context) => AlertDialog(
                  content: VideoPlayer(controller!),
                  actions: [
                    TextButton(
                      onPressed: () {
                        controller!.pause();
                        Navigator.pop(context);
                      },
                      child: Text(S.of(context).close),
                    ),
                  ],
                ),
          ).then((_) {
            controller!.dispose();
          });
        });
    } else {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              content: Image.network(
                url,
                errorBuilder:
                    (context, error, stackTrace) =>
                        Text(S.of(context).noMediaAvailable),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(S.of(context).close),
                ),
              ],
            ),
      );
    }
  }

  bool _isVideo(String url) {
    return url.contains('.mp4') || url.contains('.mov');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (details.mainImage == null || details.mainImage!.isEmpty) {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    content: Text(S.of(context).noMediaAvailable),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(S.of(context).cancel),
                      ),
                    ],
                  ),
            );
          } else {
            _showMediaDialog(details.mainImage!);
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
            color:
                isDark
                    ? AppColors.darkModeBackground
                    : AppColors.lightModeBackground,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child:
                    details.mainImage!.isNotEmpty
                        ? (_isVideo(details.mainImage!)
                            ? FutureBuilder(
                              future:
                                  VideoPlayerController.network(
                                    details.mainImage!,
                                  ).initialize(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return VideoPlayer(
                                    VideoPlayerController.network(
                                      details.mainImage!,
                                    ),
                                  );
                                } else {
                                  return Image.asset(
                                    Assets.imagesTest1,
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            )
                            : Image.network(
                              details.mainImage!,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) => Image.asset(
                                    Assets.imagesTest1,
                                    fit: BoxFit.cover,
                                  ),
                            ))
                        : Image.asset(Assets.imagesTest1, fit: BoxFit.cover),
              ),
              const SizedBox(width: 24),
              Expanded(
                flex: 5,
                child: UnitDetailsColumn(
                  context: context,
                  isDark: isDark,
                  details: details,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
