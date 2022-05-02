import 'package:dio/dio.dart';
import 'package:movie_app/core/utils/debug.dart';

class Failure {
  Failure(this.message, {required this.exception, this.description}) {
    Debug.exception(exception, message);
  }

  final String message;
  final String? description;
  final Object exception;

  static const _connectionMessage = 'No Internet Connection!';
  static const _responseMessage = 'Error!';
  static const _unexpectedMessage = 'Unexpected Error!';

  factory Failure.connection(Object e) => Failure(Failure._connectionMessage, exception: e);

  factory Failure.response(Object e) => Failure(Failure._responseMessage, exception: e);

  factory Failure.unexpected(Object e) => Failure(Failure._unexpectedMessage, exception: e);

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
    
    return Failure(message, exception: error, description: error.response?.statusMessage);
  }
}
