import '../../models/post_model/post_model.dart';

class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {
  List<PostModel> posts = [];
  PostLoadedState(posts);
}

class PostErrorState extends PostState {
  Error? error;
  PostErrorState(e);
}
