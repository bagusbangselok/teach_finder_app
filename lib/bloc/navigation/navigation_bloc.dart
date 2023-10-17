import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class NavigationEvent {}

class NavigateToEvent extends NavigationEvent {
  final String routeName;

  NavigateToEvent(this.routeName);
}

// States
abstract class NavigationState {}

class NavigationInitial extends NavigationState {}

class NavigationChanged extends NavigationState {
  final String routeName;

  NavigationChanged(this.routeName);
}

// BLoC
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial());

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToEvent) {
      yield NavigationChanged(event.routeName);
    }
  }
}
