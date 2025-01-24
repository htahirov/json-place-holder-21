import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/services/local/auth_local_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._storage) : super(AuthInitial());

  final AuthLocalStorage _storage;

  void checkAuth() async {
    emit(AuthLoading());
    if (_storage.hasToken) {
      emit(AuthAuthenticated());
      return;
    }
    emit(AuthUnauthenticated());
  }
}
