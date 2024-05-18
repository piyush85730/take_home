import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';
import 'package:take_home/feature/post_detail/domain/repositories/post_detail_repository.dart';

class GetPostCommentsUC implements UseCase<List<PostComment>, GetPostCommentsParams> {
  GetPostCommentsUC({required this.postDetailRepository});

  final PostDetailRepository postDetailRepository;

  @override
  Future<Either<Failure, List<PostComment>>> call(
    GetPostCommentsParams getPostCommentsParams,
  ) {
    return postDetailRepository.getPostComment(getPostCommentsParams);
  }
}

class GetPostCommentsParams extends Equatable {
  const GetPostCommentsParams({required this.postId});

  final int postId;

  @override
  List<Object?> get props => [postId];
}
