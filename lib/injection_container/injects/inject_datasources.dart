
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/injection_container/injection_container_imports.dart';

class InjectableDataSources {
  InjectableDataSources.inject() {
    sl
      ..registerLazySingleton<PostRemoteDataSource>(
        PostRemoteDataSourceImpl.new,
      )
      ..registerLazySingleton<PostDetailRemoteDataSource>(
        PostDetailRemoteDataSourceImpl.new,
      );
  }
}
