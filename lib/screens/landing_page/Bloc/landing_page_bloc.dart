import 'dart:async';

import 'package:bloc/bloc.dart';

part 'landing_page_state.dart';
part 'landing_page_event.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(LandingInitial()) {
    on<LoadingEvent>((event, emit) async {
      emit(LoadingState());
      await Future.delayed(Duration(seconds: 3));
      try {
        emit(LoadingSuccessState());
      } catch (e) {
        emit(LoadingErrorState());
      }
    });
    on<NavgiateEvent>((event, emit) {
      emit(NavgiateState());
    });
  }
}
