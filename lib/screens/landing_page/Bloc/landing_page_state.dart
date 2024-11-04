part of 'landing_page_bloc.dart';

abstract class LandingState {}

abstract class LandingActionState extends LandingState {}

class LandingInitial extends LandingState {}

class LoadingState extends LandingState {}

class LoadingSuccessState extends LandingState {}

class LoadingErrorState extends LandingState {}

class NavgiateState extends LandingActionState {}
