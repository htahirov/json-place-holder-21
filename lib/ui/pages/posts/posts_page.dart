import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../providers/post_provider.dart';
import '../../../utils/enums/view_type.dart';
import '../../../utils/pager.dart';
import 'widgets/post_grid_widget.dart';
import 'widgets/post_list_widget.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postProvider = context.read<PostProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => Pager.resetPassword,
                ),
              );
            },
            icon: const Icon(Icons.lock_reset_outlined),
          ),
          ValueListenableBuilder<ViewType>(
            // initialData: postProvider.initialPostViewType,
            // stream: postProvider.postsViewStream,
            valueListenable: postProvider.postViewValueNotifier,
            builder: (_, type, child) {
              return IconButton(
                icon: Icon(
                  type == ViewType.list ? Icons.grid_view : Icons.list,
                ),
                onPressed: () => postProvider.changeViewType(type),
              );
            },
          ),
          // StreamBuilder<ViewType>(
          //   initialData: postProvider.initialPostViewType,
          //   stream: postProvider.postsViewStream,
          //   builder: (_, snapshot) {
          //     final viewType = snapshot.data!;
          //     return IconButton(
          //       icon: Icon(
          //         viewType == ViewType.list ? Icons.grid_view : Icons.list,
          //       ),
          //       onPressed: () => postProvider.changeViewType(viewType),
          //     );
          //   },
          // ),
        ],
      ),
      body: StreamBuilder(
        stream: postProvider.postSubject.stream,
        builder: (_, snapshot) {
          final isLoading = !snapshot.hasData;
          final posts = snapshot.data ?? postProvider.mockPosts;
          return Skeletonizer(
            enableSwitchAnimation: true,
            enabled: isLoading,
            child: ValueListenableBuilder<ViewType>(
              // initialData: postProvider.initialPostViewType,
              // stream: postProvider.postsViewStream,
              valueListenable: postProvider.postViewValueNotifier,
              builder: (_, type, child) {
                return AnimatedSwitcher(
                  duration: Durations.extralong2,
                  child: type == ViewType.grid
                      ? PostGridWidget(posts: posts)
                      : PostListWidget(posts: posts),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
