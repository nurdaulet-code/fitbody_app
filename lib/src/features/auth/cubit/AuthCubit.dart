
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitbody_app/src/features/auth/cubit/AuthState.dart';
import 'package:fitbody_app/src/features/auth/service/AuthService.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  AuthCubit(this._authService) : super(const AuthState());

  void reset() {
    emit(const AuthState());
  }

  // ================= SIGN UP =================

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
      isSuccess: false,
    ));

    try {
      await _authService.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));

      Future.microtask(reset);
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      ));
    }
  }

  // ================= LOGIN =================

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
      isSuccess: false,
    ));

    try {
      await _authService.login(
        email: email,
        password: password,
      );

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));

      Future.microtask(reset);
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      ));
    }
  }

  // ================= GOOGLE LOGIN =================

  Future<void> signInWithGoogle() async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
      isSuccess: false,
    ));

    try {
      await _authService.signInWithGoogle();

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));

      Future.microtask(reset);
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      ));
    }
  }

  // ================= FORGOT PASSWORD =================

  Future<void> forgotPassword(String email) async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
      isSuccess: false,
    ));

    try {
      await _authService.forgotPassword(email);

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));

      Future.microtask(reset);
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
        isSuccess: false,
      ));
    }
  }

  // ================= LOGOUT =================

  Future<void> logout() async {
    emit(state.copyWith(
      isLoading: true,
      error: null,
    ));

    try {
      await _authService.logout();

      emit(state.copyWith(
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }
}

