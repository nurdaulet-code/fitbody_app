import 'package:equatable/equatable.dart';

class Setupstate extends Equatable {
  final String gender;
  final int age;
  final double weight;
  final double height;

  const Setupstate({
    this.gender = '',
    this.age = 0,
    this.weight = 0,
    this.height = 0,
  });

  Setupstate copyWith({
    String? gender,
    int? age,
    double? weight,
    double? height,
  }) {
    return Setupstate(
      gender: gender ?? this.gender,
      age: age ?? this.age,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  @override
  List<Object> get props => [
        gender,
        age,
        weight,
        height,
      ];
}