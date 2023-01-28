import 'package:flutter_bloc/flutter_bloc.dart';
import '/repos/repositories.dart';
import '/blocs/app_events.dart';
import '/blocs/app_states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());

      try {
        final users = await _userRepository.getUser();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
