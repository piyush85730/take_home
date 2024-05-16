
import 'package:take_home/injection_container/injection_container.dart';
import 'package:take_home/injection_container/injection_container_imports.dart';

class InjectableCubits {
  InjectableCubits.inject() {
    sl
      ..registerFactory(CheckInternetCubit.new)
      ..registerFactory(
        () => PostsCubit(getPostsUC: sl<GetPostsUC>()),
      );
  }
}
