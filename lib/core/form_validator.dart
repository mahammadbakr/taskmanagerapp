class FormValidator {
  static String? isRequired(String? value) {
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    }
    return null;
  }

  static String? isEmail(String? value) {
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    } else if (!value.contains('@')) {
      return 'invalid_email';
    }
    return null;
  }

  static String? isOnlyEmail(String? value) {
    if (value != null && value.isEmpty) {
      return null;
    }
    if (value != null && !value.contains('@')) {
      return 'invalid_email';
    }
    return null;
  }

  static String? isRequiredNumber(String? value) {
    RegExp regExp = RegExp(
      r"^[0-9]*$",
      caseSensitive: false,
      multiLine: false,
    );
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    } else if (!regExp.hasMatch(value)) {
      return 'only_accept_number';
    }
    return null;
  }

  static String? isNumber(String? value) {
    RegExp regExp = RegExp(
      r"^[0-9]*$",
      caseSensitive: false,
      multiLine: false,
    );
    if (value == null) {
      return 'required';
    }
    if (!regExp.hasMatch(value)) {
      return 'only_accept_number';
    }
    return null;
  }

  static String? isPhoneNumber(String? value) {
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    }
    if (value.length != 11 && value.length != 10) {
      return 'invalid_phone_number';
    }
    return null;
  }

  static String? isOnlyPhoneNumber(String? value) {
    if (value != null && value.isEmpty) {
      return null;
    }
    if (value != null && value.length != 11 && value.length != 10) {
      return 'invalid_phone_number';
    }
    return null;
  }

  static String? isPassword(String? value) {
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    }
    if (value.length < 7) {
      return 'too_short';
    }
    return null;
  }

  static String? confirmPassword(String? value, String? password) {
    if (value == null) {
      return 'required';
    }
    if (value.isEmpty) {
      return 'required';
    }
    if (value != password) {
      return 'password_not_match';
    }
    return null;
  }
}
