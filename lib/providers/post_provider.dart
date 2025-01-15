import 'dart:io';

import 'package:flutter/material.dart';

import '../data/models/remote/post_response.dart';
import '../data/repository/post_repository.dart';

enum PostStates { loading, success, error, networkError }

class PostProvider extends ChangeNotifier {
  PostProvider(this._postRepository);

  final PostRepository _postRepository;

  late List<PostResponse> posts;
  final mockPosts = List.generate(5, (_) => PostResponse.mock());

  late PostStates currentState;

  void getPosts() async {
    try {
      currentState = PostStates.loading;
      posts = await _postRepository.getPosts();
      currentState = PostStates.success;
    } on SocketException {
      currentState = PostStates.networkError;
    } catch (e) {
      currentState = PostStates.error;
    } finally {
      notifyListeners();
    }
  }
}
