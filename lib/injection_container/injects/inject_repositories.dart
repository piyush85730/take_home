
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/injection_container/injection_container_imports.dart';

class InjectableRepositories {
  InjectableRepositories.inject() {
    sl.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        postRemoteDataSource: sl<PostRemoteDataSource>(),
      ),
    );
  }
}
