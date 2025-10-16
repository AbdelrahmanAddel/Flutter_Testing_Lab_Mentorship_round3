enum FormFieldsType { name, email, password, confirmPassword }

class FormFieldValidation {
  String? validateFormField(
    FormFieldsType type,
    String? value, {
    String? passwordValue,
  }) {
    switch (type) {
      case FormFieldsType.name:
        return validateName(value);
      case FormFieldsType.email:
        return validateEmail(value);
      case FormFieldsType.password:
        return validatePassword(value);
      case FormFieldsType.confirmPassword:
        return validateConfirmPassword(value, passwordValue);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return 'Name must contain only letters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return 'Password must be 8+ chars with upper, lower, number, and symbol';
    }

    return null;
  }

  String? validateConfirmPassword(String? value, String? passwordValue) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (passwordValue != null && value != passwordValue) {
      return 'Passwords do not match';
    }
    return null;
  }
}
