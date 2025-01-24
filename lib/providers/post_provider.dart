import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_api_app/utils/enums/view_type.dart';
import 'package:rxdart/subjects.dart';

import '../data/models/remote/post_response.dart';
import '../data/repository/post_repository.dart';

class PostProvider extends ChangeNotifier {
  PostProvider(this._postRepository);

  final PostRepository _postRepository;

  late final mockPosts = List.generate(5, (_) => PostResponse.mock());

  final postSubject = BehaviorSubject<List<PostResponse>>();

  final postsViewSubject = BehaviorSubject<ViewType>.seeded(ViewType.list);

  Stream<ViewType> get postsViewStream => postsViewSubject.stream;

  ViewType get initialPostViewType => postsViewSubject.value;

  final postViewValueNotifier = ValueNotifier(ViewType.list);

  void getPosts() async {
    try {
      postSubject.add([]);
      final posts = await _postRepository.getPosts();
      postSubject.add(posts);
    } on SocketException {
      postSubject.addError('Network error');
    } catch (e) {
      postSubject.addError('Error Occured');
    }
  }

  // final Map<ViewType, IconData> viewIcons = {
  //   ViewType.list: Icons.list,
  //   ViewType.grid: Icons.grid_view,
  //   ViewType.hide: Icons.hide_image,
  // };

  void changeViewType(ViewType viewType) {
    final type = viewType == ViewType.grid ? ViewType.list : ViewType.grid;
    postViewValueNotifier.value = type;
    // postsViewSubject.add(type);
  }

  @override
  void dispose() {
    postSubject.close();
    super.dispose();
  }
}
