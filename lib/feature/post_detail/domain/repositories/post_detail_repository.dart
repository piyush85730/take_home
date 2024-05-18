import 'package:dartz/dartz.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';
import 'package:take_home/feature/post_detail/domain/usecases/get_post_comment.dart';

// ignore: one_member_abstracts
abstract class PostDetailRepository {
  Future<Either<Failure, List<PostComment>>> getPostComment(
    GetPostCommentsParams getPostCommentsParams,
  );
}
