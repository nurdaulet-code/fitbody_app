import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profilestate.dart';

class ProfileCubit extends Cubit<ProfileState> {
   final user = FirebaseAuth.instance.currentUser;
  ProfileCubit() : super(ProfileState()) {
    loadUser();
  }

  void loadUser() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(state.copyWith(
        userName: user.displayName ?? "No Name",
        email: user.email ?? "No Email",
      ));
    }
  }

  void setLoading(bool value) {
    emit(state.copyWith(loading: value));
  }
}