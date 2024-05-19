import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/usecases/delete_post.dart';
import 'package:take_home/feature/post/domain/usecases/get_posts.dart';

part 'post_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.getPostsUC, required this.deletePostUC})
      : super(PostInitial());

  final List<Post> postList = [];

  final GetPostsUC getPostsUC;
  final DeletePostUC deletePostUC;

  Future<void> getPosts() async {
    emit(PostDataLoading());
    final getPostsFailedOrSuccess = await getPostsUC(NoParams());
    getPostsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(PostDataFailed(error: failure.error));
      },
      (r) {
        postList
          ..clear()
          ..addAll(r);
        emit(PostDataLoaded(postList: postList));
      },
    );
  }

  Future<void> deletePost(int postId) async {
    emit(DeleteDataLoading());
    final getPostsFailedOrSuccess =
        await deletePostUC(DeletePostParams(postId: postId));
    getPostsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(DeleteDataFailed(error: failure.error));
      },
      (r) {
        emit(DeleteDataSuccess(isDeleted: r));
        if (r == true) {
          postList.removeWhere((item) => item.id == postId);
          emit(PostDataLoaded(postList: postList));
        }
      },
    );
  }
}
