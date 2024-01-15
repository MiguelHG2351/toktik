import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

class VideoScollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        
        return Stack(
          children: [
            Positioned(
              bottom: 20,
              right: 40,
              child: VideoButtons(video: videoPost,)
            )
          ],
        );
      },
    );
  }
}
