import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Respoitory, DataSource
  final VideoPostRepository videoRepository;
  
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    // todo: cargar videos
    await Future.delayed(const Duration(milliseconds: 2));
    
    // final List<VideoPost> newVideos = videoPosts.map((video) => 
    //   LocalVideoModel.fromJsonMap(video).toVideoPostEntity()).toList();

    final newVideos = await videoRepository.getTrendingVideosByPage(1);
    
    videos.addAll(newVideos);
    initialLoading = false;
    
    notifyListeners();
  }
}