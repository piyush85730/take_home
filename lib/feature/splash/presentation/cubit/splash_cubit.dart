import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_context/one_context.dart';
import 'package:take_home/core/constants/string_constants.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void init() {
    Future.delayed(const Duration(seconds: 2), () {
      OneContext().pushNamed(Routes.postsPage);
    });
  }
}
