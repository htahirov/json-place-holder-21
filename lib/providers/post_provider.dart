import 'dart:io';

import 'package:flutter/material.dart';

import '../data/models/remote/post_response.dart';
import '../data/services/post_service.dart';

enum PostStates { loading, success, error, networkError }

class PostProvider extends ChangeNotifier {
  late List<PostResponse> posts;
  late PostStates currentState;

  void getPosts() async {
    try {
      currentState = PostStates.loading;
      posts = await PostService.getPosts();
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
