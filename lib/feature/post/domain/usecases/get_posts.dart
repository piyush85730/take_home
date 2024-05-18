import 'package:dartz/dartz.dart';
import 'package:take_home/core/domain/usecases/usecase.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/repositories/post_repository.dart';

class GetPostsUC implements UseCase<List<Post>, NoParams> {
  GetPostsUC({required this.postRepository});

  final PostRepository postRepository;

  @override
  Future<Either<Failure, List<Post>>> call(NoParams noParams) {
    return postRepository.getPost();
  }
}
