import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/post_provider.dart';
import '../../widgets/global_loading.dart';
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
          if (postProvider.currentState == PostStates.loading) {
            return const GlobalLoading();
          } else if (postProvider.currentState == PostStates.success) {
            return PostListWidget(posts: postProvider.posts);
          } else if (postProvider.currentState == PostStates.networkError) {
            return const Center(child: Text('Network Error Occured'));
          }
          return const Center(child: Text('Error Occured'));
        },
      ),
    );
  }
}
