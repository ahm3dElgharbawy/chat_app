mixin Validator { 
  // Name validation
  String? validateRequiredField(String? value, String? name) {
    if (value == null || value.isEmpty) {
      return name != null ? '* $name is required' : '* this field is required';
    }
    return null;
  }

  // Email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '* email is required';
    } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value)) {
      return '* please enter a valid email';
    }
    return null;
  }

  // Password validation
  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return '* password is required';
    }
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'\d'));
    bool hasMinLength = password.length >= 6;
    if (!hasMinLength) {
      return '* password must be at least 6 characters long';
    }
    if (!hasUppercase) {
      return '* password must contain at least one uppercase letter';
    }
    if (!hasDigits) {
      return '* password must contain at least one number';
    }
    return null;
  }

  // Confirm password validation
  String? validateConfirmPassword(String? confirmation, String originalPassword) {
    if (confirmation == null || confirmation.isEmpty) {
      return '* Confirm password is required';
    } else if (confirmation != originalPassword) {
      return '* Confirm password does not match';
    }
    return null;
  }
}
