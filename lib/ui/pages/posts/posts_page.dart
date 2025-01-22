import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../providers/post_provider.dart';
import 'widgets/post_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: StreamBuilder(
        stream: postProvider.postSubject.stream,
        builder: (_, snapshot) {
          final isLoading = !snapshot.hasData;
          final posts = snapshot.data ?? postProvider.mockPosts;
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: isLoading,
            child: PostListWidget(
              posts: posts,
            ),
          );
        },
      ),
    );
  }
}
