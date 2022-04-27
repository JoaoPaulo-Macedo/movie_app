import 'package:dio/dio.dart';

class Failure {
  Failure(this.message, {this.description});

  final String message;
  final String? description;

  static const _connectionMessage = 'No Internet Connection!';
  static const _responseMessage = 'Error!';
  static const _unexpectedMessage = 'Unexpected Error!';

  factory Failure.connection() => Failure(Failure._connectionMessage);

  factory Failure.response() => Failure(Failure._responseMessage);

  factory Failure.unexpected() => Failure(Failure._unexpectedMessage);

  factory Failure.fromDioError(DioError error) {
    String message;

    switch (error.type) {
      case DioErrorType.other:
        message = Failure._connectionMessage;
        break;
      case DioErrorType.response:
        message = Failure._responseMessage;
        break;
      default:
        message = Failure._unexpectedMessage;
        break;
    }

    return Failure(message, description: error.response?.statusMessage);
  }
}
