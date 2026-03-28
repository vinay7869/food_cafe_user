class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email required';
    if (!value.contains('@')) return 'Invalid email';
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) return 'Phone no required';
    if (value.length != 10) return 'Please enter 10 digit number';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    if (value.length < 5) return 'Require Min 6 letters';
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    return null;
  }

  static String? dob(String? value) {
    if (value == null || value.isEmpty) return 'DOB is required';
    return null;
  }

  static String? address(String? value) {
    if (value == null) return null;
    if (value.length >= 7) return 'Max length is 7';
    return null;
  }
}
