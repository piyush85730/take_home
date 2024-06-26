import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';
import 'package:take_home/feature/post_detail/domain/usecases/get_post_comment.dart';

part 'post_detail_state.dart';

class PostDetailCubit extends Cubit<PostDetailState> {
  PostDetailCubit({required this.getPostCommentsUC})
      : super(PostDetailInitial());

  final GetPostCommentsUC getPostCommentsUC;
  List<PostComment> postCommentList = [];

  Future<void> getPostComments(int postId) async {
    emit(PostCommentDataLoading());
    final getPostsFailedOrSuccess =
        await getPostCommentsUC(GetPostCommentsParams(postId: postId));
    getPostsFailedOrSuccess.fold(
      (l) {
        final failure = l as GeneralFailure;
        emit(PostCommentDataFailed(error: failure.error));
      },
      (r) {
        postCommentList
          ..clear()
          ..addAll(r);
        emit(PostCommentDataLoaded(postCommentList: postCommentList));
      },
    );
  }

  void removePostComment(int index) {
    postCommentList.removeAt(index);
    debugPrint("removePostComment -> $index ${postCommentList.length}");
    emit(RemovePostCommentState());
    emit(PostCommentDataLoaded(postCommentList: postCommentList));
  }
}
