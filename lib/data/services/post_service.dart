import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../utils/extensions/int_extensions.dart';
import '../endpoints.dart';
import '../models/remote/post_response.dart';

class PostService {
  Future<List<PostResponse>> getPosts() async {
    Uri url = Uri.parse(Endpoints.posts);
    http.Response response = await http.get(url);
    log('Status Code: ${response.statusCode}');
    log('Response Body: ${response.body}');
    if (response.statusCode.isSuccess) {
      String body = response.body;
      final List data = jsonDecode(body);
      List<PostResponse> result =
          data.map((json) => PostResponse.fromJson(json)).toList();
      return result;
    }
    throw Exception();
  }

  void addPost() {}
}
