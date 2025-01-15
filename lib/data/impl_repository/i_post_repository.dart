import '../models/remote/post_response.dart';

import '../repository/post_repository.dart';
import '../services/post_service.dart';

class IPostRepository implements PostRepository {
  IPostRepository(this._postService);

  final PostService _postService;

  @override
  Future<void> addPost() => _postService.addPost();

  @override
  Future<bool> deletePost() => _postService.deletePost();

  @override
  Future<List<PostResponse>> getPosts() => _postService.getPosts();

  @override
  Future<void> updatePost() => _postService.updatePost();
}
