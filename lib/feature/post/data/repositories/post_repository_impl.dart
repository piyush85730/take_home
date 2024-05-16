import 'package:dartz/dartz.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:take_home/core/services/short_hand.dart';
import 'package:take_home/feature/post/data/datasources/post_remote_datasource.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/repositories/post_repository.dart';
import 'package:take_home/feature/post/domain/usecases/get_posts.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.postRemoteDataSource});

  final PostRemoteDataSource postRemoteDataSource;

  @override
  Future<Either<Failure, List<Post>>> getPost(
    GetPostsParams getPostsParams,
  ) async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final List<Post> data =
            await postRemoteDataSource.getPost(getPostsParams);
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
