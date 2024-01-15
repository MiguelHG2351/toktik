import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/respositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:toktik/config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final videoRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());
    
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider<DiscoverProvider>(
          create: (_) => DiscoverProvider(videoRepository: videoRepository)..loadNextPage(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Toktik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
