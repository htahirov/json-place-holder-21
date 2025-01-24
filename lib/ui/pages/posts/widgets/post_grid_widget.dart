import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/remote/post_response.dart';
import '../../../../providers/post_provider.dart';

class PostGridWidget extends StatelessWidget {
  const PostGridWidget({
    super.key,
    required this.posts,
  });

  final List<PostResponse> posts;

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostProvider>();
    return RefreshIndicator(
      onRefresh: () async => postProvider.getPosts(),
      child: GridView.builder(
        itemCount: 20,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          mainAxisExtent: 230,
        ),
        itemBuilder: (_, i) {
          final post = posts[i];
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      post.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      post.body!,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
