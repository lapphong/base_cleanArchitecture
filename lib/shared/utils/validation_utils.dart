class ValidationUtils {
  const ValidationUtils._();

  /// Check if a string is empty value.
  /// Return true if it is not empty.
  static bool isNotEmpty(String value) {
    return value.isNotEmpty;
  }

  /// Check if a string is a valid email.
  /// Return true if it is valid.
  static bool isValidEmail(String email) {
    if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$').hasMatch(email.trim())) {
      return false;
    }

    return true;
  }

  /// Check if a string is a valid password.
  /// Return true if it is valid.
  static bool isValidPassword(String password) {
    const _mimimumPasswordLength = 6;
    const _whitespace = ' ';

    return password.length >= _mimimumPasswordLength && !password.contains(_whitespace);
  }

  /// Check if a string is valid phone number.
  /// Return true if it is valid.
  static bool isValidPhoneNumber(String phoneNumber) {
    if (!RegExp(r'^\+?[0-9]{10,11}$').hasMatch(phoneNumber.replaceAll(' ', ''))) {
      return false;
    }

    return true;
  }

  /// Check if a string is a valid date time.
  /// Return true if it is valid.
  static bool isValidDateTime(String dateTime) {
    if (!RegExp(
      r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$',
    ).hasMatch(dateTime)) {
      return false;
    }

    return true;
  }

  /// Check if a string is alphanumeric.
  /// Return true if it is valid.
  static bool isAlphanumeric(String text) {
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(text.trim())) {
      return false;
    }

    return true;
  }

  /// Check if string is link
  /// Return true if it is valid
  static bool isLink(String text) {
    return Uri.parse(text).isAbsolute;
  }
}
