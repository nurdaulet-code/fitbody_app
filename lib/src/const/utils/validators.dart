class Validators {
  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Full name kiriting";
    }

    if (value.length < 3) {
      return "Kamida 3 ta harf kiriting";
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email kiriting";
    }

    if (!RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    ).hasMatch(value)) {
      return "Email noto'g'ri";
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Parol kiriting";
    }

    if (value.length < 6) {
      return "Parol kamida 6 ta belgidan iborat bo'lishi kerak";
    }

    return null;
  }
}