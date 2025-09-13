class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }

    List<String> errors = [];

    if (value.length < 8) {
      errors.add("at least 8 characters");
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      errors.add("one uppercase letter");
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      errors.add("one lowercase letter");
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      errors.add("one number");
    }
    if (!RegExp(r'[^\w]').hasMatch(value)) {
      errors.add("one special character");
    }

    if (errors.isEmpty) {
      return null;
    }

    return "Password must contain ${errors.join(', ')}";
  }
}
