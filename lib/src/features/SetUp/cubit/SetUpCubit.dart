import 'package:fitbody_app/src/features/SetUp/cubit/SetUpState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Setupcubit extends Cubit<Setupstate> {
  Setupcubit() : super(const Setupstate());

  void selectGender(String gender) {
    emit(state.copyWith(gender: gender));
  }

  void selectAge(int age) {
    emit(state.copyWith(age: age));
  }

  void selectWeight(double weight) {
    emit(state.copyWith(weight: weight));
  }

  void selectHeight(double height) {
    emit(state.copyWith(height: height));
  }
}