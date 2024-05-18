import 'package:dartz/dartz.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:take_home/core/services/short_hand.dart';
import 'package:take_home/feature/post_detail/data/datasources/post_detail_remote_datasource.dart';
import 'package:take_home/feature/post_detail/domain/entity/post_comment.dart';
import 'package:take_home/feature/post_detail/domain/repositories/post_detail_repository.dart';
import 'package:take_home/feature/post_detail/domain/usecases/get_post_comment.dart';

class PostDetailRepositoryImpl implements PostDetailRepository {
  PostDetailRepositoryImpl({required this.postDetailRemoteDataSource});

  final PostDetailRemoteDataSource postDetailRemoteDataSource;

  @override
  Future<Either<Failure, List<PostComment>>> getPostComment(
    GetPostCommentsParams getPostCommentsParams,
  ) async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final List<PostComment> data =
            await postDetailRemoteDataSource.getPostComments(getPostCommentsParams);
        return Right(data);
      } catch (e) {
        return Left(GeneralFailure(error: e.toString()));
      }
    } else {
      return Left(
        GeneralFailure(
          error: "Something went wrong. Please try again sometimes!",
        ),
      );
    }
  }
}
