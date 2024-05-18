import 'package:take_home/feature/post/domain/usecases/delete_post.dart';
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/injection_container/injection_container_imports.dart';

class InjectableCubits {
  InjectableCubits.inject() {
    sl
      ..registerFactory(SplashCubit.new)
      ..registerLazySingleton(
        () => PostsCubit(
          getPostsUC: sl<GetPostsUC>(),
          deletePostUC: sl<DeletePostUC>(),
        ),
      )
      ..registerLazySingleton(
        () => PostDetailCubit(getPostCommentsUC: sl<GetPostCommentsUC>()),
      );
  }
}
