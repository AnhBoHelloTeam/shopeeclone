class Myvalidators {
  static String? displayNamevalidator(String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      return 'Display Name is required';
    }
    if (displayName.length < 3) {
      return 'Display Name must be at least 3 characters';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a valid email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z|]{2,}\b')
        .hasMatch(value)) {
      return 'please enter a valid email';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value,String? password}){
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
