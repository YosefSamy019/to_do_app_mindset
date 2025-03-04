import 'package:to_do_mindset/presentation/resources/app_strings.dart';

class Failure {
  final int code;
  final String? message;

  Failure(this.code, {this.message});

  factory Failure.error(error) {
    return Failure(ErrorCodes.defaultError, message: error.toString());
  }

  factory Failure.fake(String msg) {
    return Failure(ErrorCodes.defaultError, message: msg);
  }

  factory Failure.noInternet() {
    return Failure(ErrorCodes.defaultError, message: AppStrings.noInternet);
  }
}

class ErrorCodes {
  ErrorCodes._();

  static int defaultError = 0;
}
