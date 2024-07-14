import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connectivity_app/internet_bloc/internet_event.dart';
import 'package:internet_connectivity_app/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState>{
  Connectivity _connectivity = Connectivity();
  StreamSubscription? _streamSubscription;
    InternetBloc(): super(InternetInitialState()){
      on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
      on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
      
     _streamSubscription= _connectivity.onConnectivityChanged.listen((result) { 
        if(result== ConnectivityResult.mobile || result== ConnectivityResult.wifi){
          add(InternetGainedEvent());
        }
        else{
           add(InternetLostEvent());
        }
      });
 
 
    }
    @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}