import 'package:take_home/feature/post/domain/usecases/delete_post.dart';
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/injection_container/injection_container_imports.dart';

class InjectableUseCases {
  InjectableUseCases.inject() {
    sl
      ..registerLazySingleton(
        () => GetPostsUC(postRepository: sl<PostRepository>()),
      )
      ..registerLazySingleton(
        () => DeletePostUC(postRepository: sl<PostRepository>()),
      )
      ..registerLazySingleton(
        () =>
            GetPostCommentsUC(postDetailRepository: sl<PostDetailRepository>()),
      );
  }
}
