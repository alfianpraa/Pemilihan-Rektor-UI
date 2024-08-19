class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure(
      [this.message = 'An Unknown Error Occurred.']);

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password' :
        return const SignupEmailPasswordFailure('Please enter a stronger password');
      case 'invalid-email' :
        return const SignupEmailPasswordFailure('Please enter a valid email');
      case 'email-already-in-use' :
        return const SignupEmailPasswordFailure('Email Already In Use');
      default:
        return const SignupEmailPasswordFailure();
    }
  }
}
