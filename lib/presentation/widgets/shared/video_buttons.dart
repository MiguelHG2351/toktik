import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // onPressed: () {}, icon: const Icon(Icons.favorite), color: Colors.red
        _CustomIconButton(value: video.likes, color: Colors.red, icon: Icons.favorite),
        _CustomIconButton(value: video.views, icon: Icons.remove_red_eye_outlined)
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? iconColor;
  
  const _CustomIconButton({
    required this.value,
    required this.icon,
    color
  }): iconColor = color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 30),
          color: iconColor,
        ),
        Text('$value')
      ]
    );
  }
}
