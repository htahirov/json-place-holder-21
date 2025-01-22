import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../data/models/remote/post_response.dart';
import '../data/repository/post_repository.dart';

class PostProvider extends ChangeNotifier {
  PostProvider(this._postRepository);

  final PostRepository _postRepository;

  late final mockPosts = List.generate(5, (_) => PostResponse.mock());

  final postSubject = BehaviorSubject<List<PostResponse>>();

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
}
