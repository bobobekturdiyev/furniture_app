import 'package:bloc/bloc.dart';

// import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void sendCredentials() {
    emit(AuthLoading());

    try {
      // Logika serverga ma'lumot yuborish
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError());
    }
  }
}
