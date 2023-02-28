import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webapp/controllers/post_bloc/post_event.dart';
import 'package:webapp/controllers/post_bloc/post_state.dart';
import 'package:webapp/repository/post_repository.dart';

import '../../models/post_model/post_model.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();
  PostState get initialState {
    return PostInitialState();
  }

  PostBloc() : super(PostInitialState()) {
    on<PostEvent>((event, emit) async {
      emit(PostLoadingState());
      try {
        List<PostModel> postList = await postRepository.getPosts();
        emit(PostLoadedState(postList));
      } catch (e) {
        emit(PostErrorState(e));
      }
    });
  }
}
