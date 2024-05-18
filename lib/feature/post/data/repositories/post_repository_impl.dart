import 'package:dartz/dartz.dart';
import 'package:take_home/core/error/failure.dart';
import 'package:take_home/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:take_home/core/services/short_hand.dart';
import 'package:take_home/feature/post/data/datasources/post_remote_datasource.dart';
import 'package:take_home/feature/post/domain/entity/post.dart';
import 'package:take_home/feature/post/domain/repositories/post_repository.dart';
import 'package:take_home/feature/post/domain/usecases/delete_post.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.postRemoteDataSource});

  final PostRemoteDataSource postRemoteDataSource;

  @override
  Future<Either<Failure, List<Post>>> getPost() async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final List<Post> data = await postRemoteDataSource.getPost();
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

  @override
  Future<Either<Failure, bool>> getDeletePost(
    DeletePostParams deletePostParams,
  ) async {
    if (ShortHand.checkInternetCubit.state is Online) {
      try {
        final data = await postRemoteDataSource.getDeletePost(deletePostParams);
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
