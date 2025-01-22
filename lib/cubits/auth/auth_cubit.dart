import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/hive/auth_local_storage.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._storage) : super(AuthInitial()) {
    checkAuth(); // cubit yarananda auth statusun yoxlanilmasi
  }

  final AuthLocalStorage _storage;

  void checkAuth() async {
    emit(AuthLoading());
    
    final hasToken = _storage.token != null;
    final isValid = _storage.isTokenValid;
    
    if (hasToken && !isValid) {
      await _storage.clearAuth(); // expired tokenin silinmesi ucun
      emit(AuthUnauthenticated());
      return;
    }
    
    if (hasToken && isValid) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> logout() async {
    await _storage.clearAuth();
    emit(AuthUnauthenticated());
  }
}