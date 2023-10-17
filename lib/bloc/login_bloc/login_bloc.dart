import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:teach_finder_app/bloc/auth/authentication_bloc.dart';
import 'package:teach_finder_app/bloc/login_bloc/login_event.dart';
import 'package:teach_finder_app/bloc/login_bloc/login_state.dart';
import 'package:teach_finder_app/repository/user/user_repository.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc(super.initialState, {
    required this.userRepository,
    required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
      LoginState currentState,
      LoginEvent event,
      ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        // authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}