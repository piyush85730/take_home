import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/usecases/get_posts.dart';

part 'post_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.getPostsUC}) : super(PostInitial());

  final GetPostsUC getPostsUC;

  Future<void> getPosts() async {
    emit(PostDataLoading());
    final getPostsFailedOrSuccess = await getPostsUC(NoParams());
    getPostsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(PostDataFailed(error: failure.error));
      },
      (r) {
        emit(PostDataLoaded(postList: r));
      },
    );
  }
}
