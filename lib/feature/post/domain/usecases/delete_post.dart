import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/repositories/post_repository.dart';

class DeletePostUC implements UseCase<bool, DeletePostParams> {
  DeletePostUC({required this.postRepository});

  final PostRepository postRepository;

  @override
  Future<Either<Failure, bool>> call(
    DeletePostParams deletePostParams,
  ) {
    return postRepository.getDeletePost(deletePostParams);
  }
}

class DeletePostParams extends Equatable {
  const DeletePostParams({required this.postId});

  final int postId;

  @override
  List<Object?> get props => [postId];
}
