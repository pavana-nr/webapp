import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:webapp/models/post_model/post_model.dart';

class RestClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
    ),
  );

  Future<List<PostModel>> getPost() async {
    List<PostModel> posts = [];
    try {
      Response userData = await dio.get('/users');
      posts = userData.data.map((post) => PostModel.fromJson(post)).toList();
      debugPrint('Post List: $posts');
    } on DioError catch (e) {
      parseDioError(e);
    }
    return posts;
  }

  void parseDioError(DioError e) {
    if (e.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      debugPrint('Error sending request!');
      debugPrint(e.message);
    }
  }
}
