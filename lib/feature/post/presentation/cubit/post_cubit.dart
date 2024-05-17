import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/usecases/get_posts.dart';

part 'post_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.getPostsUC}) : super(PostInitial());

  final GetPostsUC getPostsUC;

  Future<void> getPosts() async {
    emit(PostDataLoading());
    final getPostsFailedOrSuccess =
        await getPostsUC(const GetPostsParams(offset: 0));
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

  Future<List<Post>> getMorePosts({required int offset}) async {
    final getPostsFailedOrSuccess =
        await getPostsUC(GetPostsParams(offset: offset));
    if (getPostsFailedOrSuccess.isRight()) {
      try {
        final list = getPostsFailedOrSuccess
            .getOrElse(() => throw Exception("No Value Found"));
        return list;
      } catch (e) {
        return [];
      }
    } else {
      return [];
    }
  }
}
