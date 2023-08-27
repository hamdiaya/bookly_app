import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Observer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    
   debugPrint(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    
    debugPrint(bloc.toString());
  }

  @override
  void onCreate(BlocBase bloc) {
    
    debugPrint(bloc.toString());
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
   
  }
}
