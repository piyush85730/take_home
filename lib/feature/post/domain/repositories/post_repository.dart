import 'package:dartz/dartz.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/usecases/delete_post.dart';

// ignore: one_member_abstracts
abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPost();

  Future<Either<Failure, bool>> getDeletePost(
    DeletePostParams deletePostParams,
  );
}
