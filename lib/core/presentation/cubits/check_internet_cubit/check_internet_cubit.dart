import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:take_home/core/utils/library/data_connection_checked/data_connection_checker.dart';

part 'check_internet_state.dart';

class CheckInternetCubit extends Cubit<CheckInternetState> {
  CheckInternetCubit() : super(CheckInternetInitial()) {
    init();
  }

  Connectivity connectivity = Connectivity();
  StreamSubscription? connectionStream;
  StreamSubscription? dataConnectionStream;
  DataConnectionChecker dataConnectionChecker = DataConnectionChecker();

  void init() {
    connectivity.checkConnectivity().then((result) async {
      if (result == ConnectivityResult.none) {
        /// Connection is not available
        emit(Offline());
      } else {
        /// Connection is available
        await dataConnectionChecker.hasConnection
            ? emit(Online())
            : emit(Offline());
      }
    });

    connectionStream = Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        /// Connection is not available
        emit(Offline());
      } else {
        /// Connection is available
        if (result != ConnectivityResult.mobile) {
          dataConnectionStream =
              DataConnectionChecker().onStatusChange.listen((status) {
            switch (status) {
              case DataConnectionStatus.connected:
                emit(Online());
                break;
              case DataConnectionStatus.disconnected:
                emit(Offline());
                break;
            }
          });
        } else {
          /// Connected and not on wifi
          emit(Online());
        }
      }
    });
  }

  @override
  Future<void> close() async {
    await super.close();
    await connectionStream!.cancel();
    await dataConnectionStream!.cancel();
  }
}
