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
      body: Consumer<PostProvider>(
        builder: (_, __, ___) {
          if (postProvider.currentState == PostStates.networkError) {
            return const Center(child: Text('Network Error Occured'));
          } else if (postProvider.currentState == PostStates.error) {
            return const Center(child: Text('Error Occured'));
          } else {
            final isLoading = postProvider.currentState == PostStates.loading;
            return Skeletonizer(
              enableSwitchAnimation: true,
              enabled: isLoading,
              child: PostListWidget(
                posts: isLoading ? postProvider.mockPosts : postProvider.posts,
              ),
            );
          }
        },
      ),
    );
  }
}
