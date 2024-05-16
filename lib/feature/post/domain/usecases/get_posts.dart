import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/repositories/post_repository.dart';

class GetPostsUC implements UseCase<List<Post>, GetPostsParams> {
  GetPostsUC({required this.postRepository});

  final PostRepository postRepository;

  @override
  Future<Either<Failure, List<Post>>> call(
    GetPostsParams getPostsParams,
  ) {
    return postRepository.getPost(getPostsParams);
  }
}

class GetPostsParams extends Equatable {
  const GetPostsParams({required this.offset});

  final int offset;

  @override
  List<Object?> get props => [offset];
}
