class ProfileState {
  final bool loading;
  final String? userName;
  final String? email;

  ProfileState({
    this.loading = false,
    this.userName,
    this.email,
  });

  ProfileState copyWith({
    bool? loading,
    String? userName,
    String? email,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      userName: userName ?? this.userName,
      email: email ?? this.email,
    );
  }
}