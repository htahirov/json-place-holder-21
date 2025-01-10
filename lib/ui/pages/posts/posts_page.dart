import 'package:flutter/material.dart';

import '../../../data/models/remote/post_response.dart';
import '../../../data/services/post_service.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<PostResponse>> futurePosts;

  @override
  void initState() {
    futurePosts = PostService.getPosts();
    super.initState();
  }

  void _refreshPosts() {
    futurePosts = PostService.getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder(
          future: futurePosts,
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<PostResponse> posts = snapshot.data ?? [];
            return RefreshIndicator(
              onRefresh: () async => _refreshPosts(),
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
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshPosts,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
