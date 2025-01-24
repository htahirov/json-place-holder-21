import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/remote/post_response.dart';
import '../../../../providers/post_provider.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({
    super.key,
    required this.posts,
  });

  final List<PostResponse> posts;

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostProvider>();
    return RefreshIndicator(
      onRefresh: () async => postProvider.getPosts(),
      child: ListView.separated(
        itemCount: posts.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, i) {
          PostResponse post = posts[i];
          return ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: Colors.grey),
            ),
            leading: Text(
              '${post.id}',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            title: Text(post.title),
            subtitle: post.body == null ? null : Text(post.body!),
          );
        },
      ),
    );
  }
}
