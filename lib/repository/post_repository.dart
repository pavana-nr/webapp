import '../services/api_service.dart';

class PostRepository {
  static final PostRepository _singletonPostRepository =
      PostRepository._internal();

  factory PostRepository() {
    return _singletonPostRepository;
  }

  PostRepository._internal();
  RestClient restClient = RestClient();

  Future getPosts() async {
    return await restClient.getPost();
  }
}
