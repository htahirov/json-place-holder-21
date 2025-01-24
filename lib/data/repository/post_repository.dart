import '../models/remote/post_response.dart';

abstract class PostRepository {
  Future<List<PostResponse>> getPosts();
  Future<void> addPost();
  Future<bool> deletePost();
  Future<void> updatePost();
}
