import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetCubitState{initial, lost, gained}
class InternetCubit extends Cubit<InternetCubitState>{
  Connectivity _connectivity =Connectivity();
  StreamSubscription? _streamSubscription;
  InternetCubit(): super(InternetCubitState.initial){
   
   _streamSubscription= _connectivity.onConnectivityChanged.listen((result) { 
    if(result == ConnectivityResult.mobile || result== ConnectivityResult.wifi){
      emit(InternetCubitState.gained);
    }
    else{
      emit(InternetCubitState.lost);
    }
   });
  }
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}